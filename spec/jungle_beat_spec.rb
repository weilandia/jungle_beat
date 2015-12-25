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
  def setup
    @input = "deep dep dep deep"
  end

  def test_jb_new
    jb = JungleBeat.new(@input)
    assert_equal "deep dep dep deep", jb.all
    assert_equal 4, jb.count
  end

  def test_jb_play_normal_rate
    jb = JungleBeat.new(@input)
    assert_equal 4, jb.play
  end

  def test_jb_append
    jb = JungleBeat.new(@input)
    assert_equal 4, jb.append("deep bop bop deep")
    assert_equal "deep dep dep deep deep bop bop deep", jb.all
  end

  def test_jb_prepend
    jb = JungleBeat.new("deep dep dep deep deep bop bop deep")
    assert_equal 4, jb.prepend("tee tee tee tee")
    assert_equal "tee tee tee tee deep dep dep deep deep bop bop deep", jb.all
  end

  def test_jb_include
    jb = JungleBeat.new("tee tee tee tee deep dep dep deep deep bop bop deep")
    assert_equal true, jb.include?("dep")
  end

  def test_jb_pop
    jb = JungleBeat.new("tee tee tee tee deep dep dep deep deep bop bop deep")
    assert_equal "deep bop bop deep", jb.pop(4)
    assert_equal "tee tee tee tee deep dep dep deep", jb.all
  end

  def test_jb_count
    jb = JungleBeat.new("tee tee tee tee deep dep dep deep")
    assert_equal 8, jb.count
  end

  def test_jb_insert
    jb = JungleBeat.new("tee tee tee tee deep dep dep deep")
    assert_equal "tee tee tee tee boop bop bop boop deep dep dep deep", jb.insert(4, "boop bop bop boop")
  end

  def test_jb_find
    jb = JungleBeat.new("tee tee tee tee boop bop bop boop deep dep dep deep")
    assert_equal "deep dep", jb.find(8,2)
    assert_equal "tee tee tee tee boop bop bop boop deep dep dep deep", jb.all
  end

#Extensions
##Validation
  def test_append_validate
    jb = JungleBeat.new("deep")
    assert_equal 0, jb.append("Mississippi")
    assert_equal "deep", jb.all
  end

  def test_prepend_validate
    jb = JungleBeat.new("deep")
    assert_equal 3, jb.prepend("tee tee tee Mississippi")
    assert_equal "tee tee tee deep", jb.all
  end

##Speed and voice
  def test_change_rate
    jb = JungleBeat.new(@input)
    jb.rate = 100
    assert_equal 100, jb.rate
  end

  def test_play_changed_rate
    jb = JungleBeat.new(@input)
    jb.rate = 100
    assert_equal 4, jb.play
    assert_equal 100, jb.rate
  end

  def test_change_voice
    jb = JungleBeat.new(@input)
    jb.voice = "Alice"
    assert_equal "Alice", jb.voice
  end

  def test_play_changed_voice
    jb = JungleBeat.new(@input)
    jb.voice = "Alice"
    assert_equal 4, jb.play
    assert_equal "Alice", jb.voice
  end

  def test_reset_rate_to_default
    jb = JungleBeat.new(@input)
    jb.rate = 100
    assert_equal 100, jb.rate
    assert_equal 500, jb.reset_rate
    assert_equal 500, jb.rate
    assert_equal 4, jb.play
  end

  def test_reset_voice_to_default
    jb = JungleBeat.new(@input)
    jb.voice = "Alice"
    assert_equal "Alice", jb.voice
    assert_equal "Boing", jb.reset_voice
    assert_equal "Boing", jb.voice
    assert_equal 4, jb.play
  end

  def test_integrated_base
    jb = JungleBeat.new(@input)
    assert_equal 4, jb.play
    assert_equal 4, jb.append("deep bop bop deep")
    assert_equal "deep dep dep deep deep bop bop deep", jb.all
    assert_equal 4, jb.prepend("tee tee tee tee")
    assert_equal "tee tee tee tee deep dep dep deep deep bop bop deep", jb.all
    assert_equal true, jb.include?("dep")
    assert_equal "deep bop bop deep", jb.pop(4)
    assert_equal "tee tee tee tee deep dep dep deep", jb.all
    assert_equal 8, jb.count
    assert_equal "tee tee tee tee boop bop bop boop deep dep dep deep", jb.insert(4, "boop bop bop boop")
    assert_equal "deep dep", jb.find(8, 2)
  end

  def test_integrated_validation
    jb = JungleBeat.new("deep")
    assert_equal 0,  jb.append("Mississippi")
    assert_equal "deep", jb.all
    assert_equal 3, jb.prepend("tee tee tee Mississippi")
    assert_equal "tee tee tee deep", jb.all
    assert_equal 0, jb.append("California New Jersey New York")
    assert_equal 0, jb.prepend("San Francisco Newark NYC")
  end

  def test_integrated_speed_and_voice
    jb = JungleBeat.new("deep dop dop deep")
    assert_equal 100, (jb.rate = 100)
    assert_equal "Alice", (jb.voice = "Alice")
    assert_equal 4, jb.play
    assert_equal 500, jb.reset_rate
    assert_equal 500, jb.rate
    assert_equal "Boing", jb.reset_voice
    assert_equal "Boing", jb.voice
    assert_equal 4, jb.play
  end
end
