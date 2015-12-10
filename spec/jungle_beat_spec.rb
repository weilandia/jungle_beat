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
  def test_jb_new
    jb = JungleBeat.new("deep dep dep deep")
    binding.pry
    assert jb.all == "deep dep dep deep"
    assert jb.count == 4
  end

  def test_jb_play_normal_rate
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

#Extensions
##Validation
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

##Speed and voice
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

  def test_change_voice
    jb = JungleBeat.new("deep dep dep deep")
    jb.voice = "Alice"
    assert jb.voice == "Alice"
  end

  def test_play_changed_voice
    jb = JungleBeat.new("deep dep dep deep")
    jb.voice = "Alice"
    assert jb.play == 4
    assert jb.voice == "Alice"
  end

  def test_reset_rate_to_default
    jb = JungleBeat.new("deep dep dep deep")
    jb.rate = 100
    assert jb.rate == 100
    assert jb.reset_rate == 500
    assert jb.rate == 500
    assert jb.play == 4
  end

  def test_reset_voice_to_default
    jb = JungleBeat.new("deep dep dep deep")
    jb.voice = "Alice"
    assert jb.voice == "Alice"
    assert jb.reset_voice == "Boing"
    assert jb.voice == "Boing"
    assert jb.play == 4
  end

  def test_integrated_base
    jb = JungleBeat.new("deep dep dep deep")
    assert jb.play == 4
    assert jb.append("deep bop bop deep") == 4
    assert jb.all == "deep dep dep deep deep bop bop deep"
    assert jb.prepend("tee tee tee tee") == 4
    assert jb.all == "tee tee tee tee deep dep dep deep deep bop bop deep"
    assert jb.include?("dep") == true
    assert jb.pop(4) == "deep bop bop deep"
    assert jb.all == "tee tee tee tee deep dep dep deep"
    assert jb.count == 8
    assert jb.insert(4, "boop bop bop boop") == "tee tee tee tee boop bop bop boop deep dep dep deep"
    assert jb.find(8, 2) == "deep dep"
  end

  def test_integrated_validation
    jb = JungleBeat.new("deep")
    assert jb.append("Mississippi") == 0
    assert jb.all == "deep"
    assert jb.prepend("tee tee tee Mississippi") == 3
    assert jb.all == "tee tee tee deep"
    assert jb.append("California New Jersey New York") == 0
    assert jb.prepend("San Francisco Newark NYC") == 0
  end

  def test_integrated_speed_and_voice
    jb = JungleBeat.new("deep dop dop deep")
    assert (jb.rate = 100) == 100
    assert (jb.voice = "Alice") == "Alice"
    assert jb.play == 4
    assert jb.reset_rate == 500
    assert jb.rate == 500
    assert jb.reset_voice == "Boing"
    assert jb.voice == "Boing"
    assert jb.play == 4
  end

  # def test_voices
  #   jb = JungleBeat.new("bop")
  #   jb.rate = 200
  #   jb.play
  #   assert (jb.voice = "Alice") == "Alice"
  #   jb.play
  #   assert (jb.voice = "Agnes") == "Agnes"
  #   jb.play
  #   assert (jb.voice = "Kathy") == "Kathy"
  #   jb.play
  #   assert (jb.voice = "Princess") == "Princess"
  #   jb.play
  #   assert (jb.voice = "Victoria") == "Victoria"
  #   jb.play
  #   assert (jb.voice = "Alex") == "Alex"
  #   jb.play
  #   assert (jb.voice = "Bruce") == "Bruce"
  #   jb.play
  #   assert (jb.voice = "Fred") == "Fred"
  #   jb.play
  #   assert (jb.voice = "Junior") == "Junior"
  #   jb.play
  #   assert (jb.voice = "Ralph") == "Ralph"
  #   jb.play
  #   assert (jb.voice = "Albert") == "Albert"
  #   jb.play
  #   assert (jb.voice = "Bad News") == "Bad News"
  #   jb.play
  #   assert (jb.voice = "Bahh") == "Bahh"
  #   jb.play
  #   assert (jb.voice = "Bells") == "Bells"
  #   jb.play
  #   assert (jb.voice = "Bubbles") == "Bubbles"
  #   jb.play
  #   assert (jb.voice = "Cellos") == "Cellos"
  #   jb.play
  #   assert (jb.voice = "Deranged") == "Deranged"
  #   jb.play
  #   assert (jb.voice = "Good News") == "Good News"
  #   jb.play
  #   assert (jb.voice = "Hysterical") == "Hysterical"
  #   jb.play
  #   assert (jb.voice = "Pipe Organ") == "Pipe Organ"
  #   jb.play
  #   assert (jb.voice = "Trinoids") == "Trinoids"
  #   jb.play
  #   assert (jb.voice = "Whisper") == "Whisper"
  #   jb.play
  #   assert (jb.voice = "Zarvox") == "Zarvox"
  #   jb.play
  # end
  #
  # def test_good_news
  #   jb = JungleBeat.new("dop dop dop dop dop dop dop dop dop dop dop dop dop dop dop dop dop dop dop dop dop dop")
  #   assert (jb.rate = 150) == 150
  #   assert (jb.voice = "Good News") == "Good News"
  #   jb.play
  # end
end
