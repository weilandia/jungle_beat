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
  def test__jungle_beat_new
    jb = JungleBeat.new("deep dop dop deep")
    assert jb.all == "deep dop dop deep"
    assert jb.count == 4
  end

  def test_play_normal_rate
    jb = JungleBeat.new("deep dep dep deep")
    assert jb.play == 4
  end

  def test_jb_append
    jb = JungleBeat.new("deep dep dep deep")
    assert jb.append("deep bop bop deep") == 4
    assert jb.all == "deep dep dep deep deep bop bop deep"
  end

  def test_jb_prepend
    jb = JungleBeat.new("deep dep dep deep deep bop bop deep")
    assert jb.prepend("tee tee tee tee") == 4
    assert jb.all == "tee tee tee tee deep dep dep deep deep bop bop deep"
  end

  def test_jb_include
    jb = JungleBeat.new("tee tee tee tee deep dep dep deep deep bop bop deep")
    assert jb.include?("dep") == true
  end

  def test_jb_pop
    jb = JungleBeat.new("tee tee tee tee deep dep dep deep deep bop bop deep")
    assert jb.pop(4) == "deep bop bop deep"
    assert jb.all == "tee tee tee tee deep dep dep deep"
  end

  def test_jb_count
    jb = JungleBeat.new("tee tee tee tee deep dep dep deep")
    assert jb.count == 8
  end

  def test_jb_insert
    jb = JungleBeat.new("tee tee tee tee deep dep dep deep")
    assert jb.insert(4, "boop bop bop boop") == "tee tee tee tee boop bop bop boop deep dep dep deep"
  end

  def test_jb_find
    jb = JungleBeat.new("tee tee tee tee boop bop bop boop deep dep dep deep")
    assert jb.find(8,2) == "deep dep"
    jb.find(8,2)
    assert jb.all == "tee tee tee tee boop bop bop boop deep dep dep deep"
  end

  def test_append_validate
    jb = JungleBeat.new("deep")
    assert jb.append("Mississippi") == 0
    assert jb.all == "deep"
  end

  def test_prepend_validate
    jb = JungleBeat.new("deep")
    assert jb.prepend("tee tee tee Mississippi") == 3
    assert jb.all == "tee tee tee deep"
  end

  def test_change_rate
    jb = JungleBeat.new("deep dep dep deep")
    jb.rate = 100
    assert jb.rate == 100
  end

  def test_play_changed_rate
    jb = JungleBeat.new("deep dep dep deep")
    jb.rate = 100
    assert jb.play == 4
    assert jb.rate == 100
  end

end
