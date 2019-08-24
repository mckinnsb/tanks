class Tank < Solid
  def initialize x, y
    @x = x
    @y = y

    @r = @a = 255
    @g = @b = 0
    @h = @w = TANK_SIZE
  end
end
