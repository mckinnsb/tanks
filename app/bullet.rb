class Bullet < Solid
  attr_accessor :dx, :dy

  def initialize size
    @w = size
    @h = size
    @g = 255
  end
end
