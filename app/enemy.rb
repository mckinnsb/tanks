class Enemy < Solid
  attr_accessor :speed

  def initialize speed
    @w = TANK_SIZE
    @h = TANK_SIZE
    @x = WIDTH - TANK_SIZE
    @y = 0
    @speed = speed
  end
end
