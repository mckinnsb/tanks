SOLID_ACCESSORS = [:x, :y, :w, :h, :r, :g, :b, :a]

class Solid
  attr_accessor(*SOLID_ACCESSORS)

  def primitive_marker
    :solid 
  end

  def render outputs
    outputs.solids << self
  end

  def intersects_rect? rect
    [x, y, w, h].intersects_rect? [rect.x, rect.y, rect.w, rect.h]
  end
end
