require_relative '../lib/linked_list'
require_relative '../lib/node'

class JungleBeat < LinkedList

  attr_accessor :rate

  def initialize(value)
    validate_and_parse(value)
    create
    link_nodes
    @rate = 500
  end

  def play
    `say -r #{@rate} -v Boing #{self.all}`
    self.count
  end
end
