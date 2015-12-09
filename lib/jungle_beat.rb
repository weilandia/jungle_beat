require_relative '../lib/linked_list'
require_relative '../lib/node'

class JungleBeat < LinkedList

  attr_accessor :rate, :voice

  def initialize(value)
    validate_and_parse(value)
    create
    link_nodes
    @rate = 500
    @voice = "Boing"
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end

  def play
    `say -r #{@rate} -v #{@voice} #{self.all}`
    self.count
  end
end
