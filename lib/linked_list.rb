require_relative '../lib/node'

class LinkedList

  attr_accessor :head

  def initialize(value)
    validate_and_parse(value)
    create
    link_nodes
  end

  def all
    nodes = []
    current_node = @head
    nodes << current_node.value
    while current_node.next_node != nil
      current_node = current_node.next_node
      nodes << current_node.value
    end
    nodes << current_node.next_node
    nodes.join(" ").rstrip
  end

  def all_list
    nodes = []
    current_node = @head
    nodes << current_node.value
    while current_node.next_node != nil
      current_node = current_node.next_node
      nodes << current_node.value
    end
    nodes << current_node.next_node
    nodes.join("-->") + "nil"
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
    while current_node
      return true if value == current_node.value
      current_node = current_node.next_node
    end
    false
  end

  def prepend(value)
    temporary_head = @head
    validate_and_parse(value)
    #for edge case prepending only invalid inputs
    return 0 if @validated_nodes == []
    #
    create
    link_nodes
    @current_node.next_node = temporary_head
    prepend_count = @validated_nodes.length + 1
    prepend_count
  end

  def append(value)
    validate_and_parse(value)
    link_nodes
    append_count = @validated_nodes.length
    append_count
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
        node_step
        popped_nodes << @current_node.next_node.value
        @current_node.next_node = nil
      end
      return popped_nodes.reverse.join(" ")
    end
  end

  def insert(position,nodes)
    validate_and_parse(nodes)
    current_node = @head
    count = 1
    if position <= 0
      self.prepend(nodes)
    elsif position > self.count
      self.append(nodes)
    else
      while count != position
        current_node = current_node.next_node
        count += 1
      end
      temporary_head_back = current_node.next_node
      current_node.next_node = Node.new(@validated_nodes[0])
      @validated_nodes = @validated_nodes[1..-1]
      @validated_nodes.each do |node|
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


# _____UTILITY METHODS_____

  def validate_and_parse(input_string) #utility
    @validated_nodes = []
    input_string = input_string.to_s
    valid_inputs = ["node1","node2","node3","node4","node5","node6","node7","node8","node9","node10","tee", "dee", "deep", "bop", "boop", "la", "na","dep","dop"]
    input_string.split.each do |input|
      if valid_inputs.include?(input)
        @validated_nodes << input
      end
    end
  end

  def create #utility
    @head = Node.new(@validated_nodes[0])
    @validated_nodes = @validated_nodes[1..-1]
    @current_node = @head
  end

  def link_nodes #utility
    @current_node = @head
    @validated_nodes.each do |node|
      while @current_node.next_node != nil
        @current_node = @current_node.next_node
      end
      @current_node.next_node = Node.new(node)
      @current_node = @current_node.next_node
    end
  end

  def node_step
    @current_node = @head
    while @current_node.next_node.next_node != nil
      @current_node = @current_node.next_node
    end
  end

end
