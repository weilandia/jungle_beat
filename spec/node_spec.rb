gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/node'

class NodeTest < Minitest::Test
  def test_create_node
    node1 = Node.new("node1")
    node1
  end

  def test_next_node
    node1 = Node.new("node1")
    assert node1.next_node == nil
  end


end
