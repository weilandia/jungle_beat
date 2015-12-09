gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/node'
require_relative '../lib/linked_list'
require_relative '../lib/jungle_beat'

# Use mrspec tag:
 # meta current: true
 # Call with: mrspec file.rb -t current

class JungleBeatTest < Minitest::Test
  def test_create_jungle_beat
    jb = JungleBeat.new("deep dep dep deep")
    assert jb.all == "deep dep dep deep"
    assert jb.count == 4
  end

  def test_play
    jb = JungleBeat.new("deep dep dep deep")
    assert jb.play == 4
  end
end
