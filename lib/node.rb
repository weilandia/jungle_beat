
class Node

  attr_reader :value
  attr_accessor :next_node

  def initialize(value, next_node = nil)
    @value = value
  end
end
