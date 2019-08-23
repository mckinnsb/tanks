#reminders
WIDTH = 720
HEIGHT = 1280
SOLID_ACCESSORS = [:x, :y, :w, :h, :r, :g, :b, :a]

#remove when you want state to actually persist
$gtk.reset

def degrees_to_radians degrees
  degrees * (Math::PI / 180)
end

class TankDefense
  STARTING_POSITION = [0, 0]

  attr_accessor :outputs, :inputs, :state

  def tick
    defaults
    render
    calc
    process_input
  end

  def calc
  end

  def defaults
    outputs.static_background_color = [255, 255, 255]
    state.tank ||= Tank.new 0, 0
    state.cannon ||= Cannon.new(state.tank.w * 1.5)
  end

  def process_input 
    if inputs.keyboard.right or inputs.keyboard.left
      rotate_cannon
    end
  end

  def renderables
    [state.tank, state.cannon]
  end

  def rotate_cannon
    dir = inputs.keyboard.right ? -1 : 1
    rotation = [0, state.cannon.angle + dir, 90].sort[1]

    if rotation != state.cannon.angle
      state.cannon.angle += dir
    end
  end

  def render
    renderables.each do |r|
      r.render outputs
    end
  end
end

class Solid
  attr_accessor(*SOLID_ACCESSORS)

  def primitive_marker
    :solid 
  end

  def render outputs
    outputs.solids << self
  end
end

class Cannon < Solid
  attr_accessor :radius, :center
  attr_reader :angle

  def initialize radius
    @radius = radius

    self.angle = 0.0

    @h = 8
    @w = 8
  end

  def angle= value
    @x = Math.cos(degrees_to_radians(value)) * @radius
    @y = Math.sin(degrees_to_radians(value)) * @radius + 16
    @angle= value
  end
end

class Tank < Solid
  def initialize x, y
    @x = x
    @y = y

    @r = @a = 255
    @g = @b = 0
    @h = @w = 32
  end
end

$game = TankDefense.new

def tick args
  $game.inputs = args.inputs
  $game.outputs = args.outputs
  $game.state = args.state
  $game.tick
end
