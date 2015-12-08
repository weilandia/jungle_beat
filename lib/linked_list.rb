require_relative '../lib/node'



class LinkedList

  attr_accessor :head, :count, :tail
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

  def prepend(value)
    temporary_head = @head
    new_nodes = value.split(" ")
    @head = Node.new(new_nodes[0])
    new_nodes = new_nodes[1..-1]
    current_node = @head
    new_nodes.each do |node|
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(node)
      current_node = current_node.next_node
    end
    current_node.next_node = temporary_head
    count = new_nodes.length + 1
    count
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

  def pop(n)
    if self.count <= n
      # p "Your head node, #{@head.value}, has been destroyed. You no longer have a list."
      @head = nil
    elsif self.count > 1
      n.times do
        current_node = @head
        while current_node.next_node.next_node != nil
          current_node = current_node.next_node
        end
        current_node.next_node = nil
      end
    end
  end

end
