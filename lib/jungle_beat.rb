require_relative '../lib/linked_list'
require_relative '../lib/node'

class JungleBeat < LinkedList

  def play
    `say -r 100 -v Boing #{self.all}`
    self.count
  end
end
