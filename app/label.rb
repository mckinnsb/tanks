require "app/constants.rb"

LABEL_ACCESSORS = [:x, :y, :text,
                   :size, :size_enum,
                   :alignment, :alignment_enum,
                   :r, :g, :b, :a, :font]

class Label
  attr_accessor(*LABEL_ACCESSORS)

  def primitive_marker
    :label
  end
end

class HitPointLabel < Label
  attr_reader :hp

  def initialize starting_hp
    self.hp = starting_hp
    @x = 18
    @y = HEIGHT - 20
  end

  def hp= value
    @hp = value
    @text = "HP: #{hp}"
  end
end

class LoseLabel < Label
  def initialize 
    @x = WIDTH / 2 - 18
    @y = HEIGHT - 20
    @text = "YOU LOSE!"
    @size = 5
  end
end

class ScoreLabel < Label
  attr_reader :score

  def initialize
    self.score = 0
    @x = WIDTH - 100
    @y = HEIGHT - 20
  end

  def score= value
    @score = value
    @text = "Score: #{score}"
  end
end

class WinLabel < Label
  def initialize 
    @x = WIDTH / 2 - 18
    @y = HEIGHT - 20
    @text = "YOU WON!"
    @size = 6
  end
end

