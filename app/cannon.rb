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
    @x = Math.cos(degrees_to_radians(value)) * @radius + TANK_SIZE / 2
    @y = Math.sin(degrees_to_radians(value)) * @radius + TANK_SIZE / 2
    @angle= value
  end
end
