require './start'

class Player
  attr_accessor :name, :points

  def initialize(name, points = 3)
    @name = name
    @points = points
  end
end

