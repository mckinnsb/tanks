#remove when you want state to actually persist between reloads
$gtk.reset

require "app/constants.rb"
require "app/solid.rb"
require "app/enemy.rb"
require "app/cannon.rb"
require "app/bullet.rb"
require "app/tank.rb"
require "app/label.rb"

def degrees_to_radians degrees
  degrees * (Math::PI / 180)
end

class TankDefense
  STARTING_POSITION = [0, 0]

  attr_accessor :outputs, :inputs, :state, :running

  def tick
    defaults
    render 

    if state.running
      calc 
    end

    process_input 
  end

  def calc
    survivors = []
    dead_enemies = []

    state.bullets.each do |bullet|
      bullet.x += bullet.dx
      bullet.y += bullet.dy
      bullet.dy -= GRAVITY

      hit = false

      state.enemies.each do |enemy|
        if enemy.intersects_rect? bullet
          hit = true
          dead_enemies.push enemy
        end
      end

      if bullet.y > 0 and not hit
        survivors.push bullet
      end
    end

    state.enemies -= dead_enemies
    state.bullets = survivors
    state.score_display.score += dead_enemies.count

    if state.tick_count % ENEMY_SPAWN == 0
      state.enemies.push Enemy.new(ENEMY_SPEED)
    end
 
    dead_enemies = []

    state.enemies.each do |enemy|
      enemy.x -= enemy.speed

      if enemy.intersects_rect? state.tank
        dead_enemies.push enemy
      end
    end

    state.enemies -= dead_enemies
    state.hitpoint_display.hp -= dead_enemies.count

    if state.hitpoint_display.hp == 0
      lose
    end
  end

  def fire_bullet
    bullet = Bullet.new BULLET_SIZE
    bullet.x = state.cannon.x
    bullet.y = state.cannon.y

    radians = degrees_to_radians state.cannon.angle
    bullet.dx = BULLET_VELOCITY * Math.cos(radians)
    bullet.dy = BULLET_VELOCITY * Math.sin(radians)

    state.bullets.push bullet
  end

  def defaults
    outputs.static_background_color = [255, 255, 255]
    state.tank ||= Tank.new 0, 0
    state.cannon ||= Cannon.new(state.tank.w)
    state.bullets ||= []
    state.enemies ||= []
    state.score_display ||= ScoreLabel.new 
    state.hitpoint_display ||= HitPointLabel.new 3
    state.running ||= true
  end

  def lose
    state.running = false
    state.win = false
  end

  def process_input 
    if inputs.keyboard.right or inputs.keyboard.left
      rotate_cannon
    end

    if inputs.keyboard.key_down.enter
      fire_bullet
    end
  end

  def renderables
    [state.tank, state.cannon, state.bullets, state.enemies].flatten
  end

  def rotate_cannon
    dir = inputs.keyboard.right ? -1 : 1
    dir *= 2
    rotation = [0, state.cannon.angle + dir, 90].sort[1]

    if rotation != state.cannon.angle
      state.cannon.angle += dir
    end
  end

  def render
    renderables.each do |r|
      r.render outputs
    end

    if state.win == nil
      outputs.labels << state.score_display
      outputs.labels << state.hitpoint_display
    elsif state.win == false
      state.lose_display ||= LoseLabel.new
      outputs.labels << state.lose_display
    else
      state.win_display ||= WinLabel.new
      outputs.labels << state.win_display
    end
  end
end

$game = TankDefense.new

def tick args
  $game.inputs = args.inputs
  $game.outputs = args.outputs
  $game.state = args.state
  $game.tick
end
