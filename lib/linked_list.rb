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
    @nodes.join(" ").rstrip
  end

  def all_list
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
    if n <= 0
      return
    end
    if self.count <= n
      message = "Your head node, #{@head.value}, has been destroyed. You no longer have a list."
      @head = nil
      message
    elsif self.count > 1
      popped_nodes = []
      n.times do
        current_node = @head
        while current_node.next_node.next_node != nil
          current_node = current_node.next_node
        end
        popped_nodes << current_node.next_node.value
        current_node.next_node = nil
      end
      return popped_nodes.reverse.join(" ")
    end
  end

  def insert(position,nodes)
    new_nodes = nodes.split(" ")
    current_node = @head
    count = 1
    if position > self.count
      position = self.count
    end
    if position <= 0
      self.prepend(nodes)
    else
      while count != position
        current_node = current_node.next_node
        count += 1
      end
      temporary_head_back = current_node.next_node
      current_node.next_node = Node.new(new_nodes[0])
      new_nodes = new_nodes[1..-1]
      new_nodes.each do |node|
        while current_node.next_node != nil
          current_node = current_node.next_node
        end
        current_node.next_node = Node.new(node)
      end
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = temporary_head_back
    end
    self.all
  end

  def find(position,nodes=1)
    current_node = @head
    head = @head
    position_count = 0
    # start edge cases:
    if nodes > self.count - position
      nodes = self.count - position
    end
    if nodes <= 0
      nodes = 1
    end
    if position == self.count
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.value
    elsif position > self.count
      message = "There are no nodes starting at postion #{position}. The tail of the list is at position #{self.count}."
      message
    elsif position <= 0
      message = "Positions in this list start at 1. Please enter a valid position"
    # end edge cases
    else
      while position_count != position
        current_node = current_node.next_node
        position_count += 1
      end
      @head = current_node
      node_count = 1
      while node_count != nodes
        current_node = current_node.next_node
        node_count += 1
      end
      current_node = current_node.next_node
      popped_nodes = []
      while current_node != nil
        popped_nodes << current_node.value
        current_node = current_node.next_node
      end
      pop_num = self.count - nodes
      self.pop(pop_num)
      found = self.all
      @head = head
      self.append(popped_nodes.join(" "))
      found
    end
  end

end
