gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/node'

class NodeTest < Minitest::Test
  def test_create_node
    node1 = Node.new("node1")
    node1
  end

  def test_next_node
    node1 = Node.new("node1")
    assert_equal nil, node1.next_node
  end
end
