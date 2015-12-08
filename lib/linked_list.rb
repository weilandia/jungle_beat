require '../lib/node'

class LinkedList

  attr_accessor :head, :count
  attr_reader :nodes

  def initialize(value)
    new_nodes = value.split(" ")
    @head = Node.new(new_nodes[0])
    new_nodes = new_nodes[1..-1]
    new_nodes.each do |node|
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(node)
    end
  end

  def all
    @nodes = []
    current_node = @head
    @nodes << current_node.value
    while current_node.next_node != nil
      current_node = current_node.next_node
      @nodes << current_node.value
    end
    @nodes << current_node.next_node
    @nodes.join("-->") + "nil"
  end

  def append(value)
    new_nodes = value.split(" ")
    count = 0
    new_nodes.each do |node|
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      count += 1
      current_node.next_node = Node.new(node)
    end
    count
  end

  def count
    @count = 0
    current_node = @head
    @count += 1
    while current_node.next_node != nil
      @count += 1
      current_node = current_node.next_node
    end
    @count
  end

  def include?(value)
    current_node = @head
    while current_node.value != value
      current_node = current_node.next_node
    end
    true
  end

  def include?(value)
    current_node = @head
    while current_node
      return true if value == current_node.value
      current_node = current_node.next_node
    end
    false
  end


  def prepend(valuue)
    temporary_head = @head
    new_nodes = value.split(" ")
    @head = Node.new(new_nodes[0])
    new_nodes = new_nodes[1..-1]
    new_nodes.each do |node|
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = temporary_head
    end
  end
end
