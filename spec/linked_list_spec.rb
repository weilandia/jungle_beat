gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/linked_list'
require '../lib/node'

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
    assert list.all == "node1-->nil"
  end

  def test_all_multi_value
    list = LinkedList.new("node1 node2 node3 node4")
    assert list.head.value == "node1"
    assert list.all == "node1-->node2-->node3-->node4-->nil"
  end

  def test_append
    list = LinkedList.new("node1")
    assert list.head.value == "node1"
    list.append("node2")
    assert list.all == "node1-->node2-->nil"
  end

  def test_count
    list = LinkedList.new("node1 node2")
    assert list.count == 2
    list.append("node3 node4 node5")
    assert list.count == 5
  end

  def test_prepend
    skip
    list = LinkedList.new("node1 node2")
    assert list.head.value == "node1"
    assert list.all == "node1-->node2-->nil"
    list.prepend("node5 node6")
    assert list.all == "node5-->node6-->node1-->node2-->nil"
  end

  def test_include?
    list = LinkedList.new("node1 node2")
    refute list.include?("node3")
    list.append("node3")
    assert list.include?("node3")
  end

  def test_pop
    skip
  end

  def test_insert
    skip
  end

  def test_find
    skip
  end
end
