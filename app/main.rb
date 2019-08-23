#reminders
WIDTH = 720
HEIGHT = 1280
SOLID_ACCESSORS = [:x, :y, :w, :h, :r, :g, :b, :a]

#remove when you want state to actually persist
$gtk.reset

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
    # red, blue, green, not red, green, blue
    # outputs.static_background_color = [4, 56, 6]
   
    outputs.static_background_color = [255, 255, 255]
    state.tank ||= Tank.new 0, 0
    state.cannon ||= Cannon.new state.tank.w * 1.5, state.tank.h * 0.5
  end

  def process_input
  end

  def renderables
    [state.tank, state.cannon]
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
  def initialize x, y
    @x = x
    @y = y

    @h = 8
    @w = 8
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
