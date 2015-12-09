gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/node'
require_relative '../lib/linked_list'


# Use mrspec tag:
 # meta current: true
 # Call with: mrspec file.rb -t current

class LinkedListTest < Minitest::Test

  def test_create_linked_list_with_head
    list = LinkedList.new("node1")
    assert list.head.value == "node1"
  end

  def test_create_list_from_multi_word_string_in_order
    list = LinkedList.new("node1 node2 node3 node4")
    assert list.head.value == "node1"
  end

  def test_all_one_value
    list = LinkedList.new("node1")
    assert list.head.value == "node1"
    assert list.all == "node1"
  end

  def test_all_multi_value
    list = LinkedList.new("node1 node2 node3 node4")
    assert list.head.value == "node1"
    assert list.all == "node1 node2 node3 node4"
  end

  def test_append
    list = LinkedList.new("node1")
    assert list.head.value == "node1"
    list.append("node2")
    assert list.all == "node1 node2"
  end

  def test_count_with_append
    list = LinkedList.new("node1 node2")
    assert list.count == 2
    list.append("node3 node4 node5")
    assert list.count == 5
  end

  def test_count_with_prepend
    list = LinkedList.new("node1 node2")
    assert list.count == 2
    list.prepend("node3 node4 node5")
    assert list.count == 5
  end

  def test_prepend
    list = LinkedList.new("node1 node2")
    assert list.head.value == "node1"
    assert list.all == "node1 node2"
    list.prepend("node5 node6")
    assert list.prepend("node5 node6") == 2
    assert list.all == "node5 node6 node5 node6 node1 node2"
  end

  def test_include?
    list = LinkedList.new("node1 node2")
    refute list.include?("node3")
    list.append("node3")
    assert list.include?("node3")
  end

  def test_pop_simple
    list = LinkedList.new("node1")
    assert list.pop(1) == "Your head node, node1, has been destroyed. You no longer have a list."
  end

  def test_pop_multi_input_multi_pop
    list = LinkedList.new("node1 node2 node3 node4")
    assert list.pop(2) == 2
    assert list.all == "node1 node2"
  end

  def test_insert
    list = LinkedList.new("node1 node2 node3 node4")
    list.insert(2,"node5 node6")
    assert list.all == "node1 node2 node5 node6 node3 node4"
  end

  def test_find
    list = LinkedList.new("node1 node2 find1 find2 node3 node4")
    list.find(2,2) == "find1 find2"
  end
end
