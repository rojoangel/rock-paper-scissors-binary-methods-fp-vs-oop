require "./rock_paper_scissors.rb"
require "test/unit"

class TestGame < Test::Unit::TestCase
  private
  ROCK = Rock.new(Player.new(1))
  PAPER = Paper.new(Player.new(2))
  SCISSORS = Scissors.new(Player.new(3))
  public
  def test_paper_beats_rock()
    result = Game.new.play(ROCK, PAPER)
    assert_equal(PAPER ,result.winner)
    assert_equal(ROCK, result.loser)
  end
  def test_rock_is_beaten_by_paper()
    result = Game.new.play(PAPER, ROCK)
    assert_equal(PAPER ,result.winner)
    assert_equal(ROCK, result.loser)
  end
  def test_rock_beats_scissors()
    result = Game.new.play(ROCK, SCISSORS)
    assert_equal(ROCK, result.winner)
    assert_equal(SCISSORS, result.loser)
  end
  def test_scissors_are_beaten_by_rock()
    result = Game.new.play(SCISSORS, ROCK)
    assert_equal(ROCK, result.winner)
    assert_equal(SCISSORS, result.loser)
  end
  def test_rock_ties_with_rock()
    result = Game.new.play(ROCK,ROCK)
    assert_equal(ROCK, result.gesture1)
    assert_equal(ROCK, result.gesture1)
  end
  def test_scissors_beat_paper()
    result = Game.new.play(SCISSORS, PAPER)
    assert_equal(SCISSORS, result.winner)
    assert_equal(PAPER, result.loser)
  end
  def test_paper_is_beaten_by_scissors()
    result = Game.new.play(PAPER, SCISSORS)
    assert_equal(SCISSORS, result.winner)
    assert_equal(PAPER, result.loser)
  end
  def test_paper_ties_with_paper()
    result = Game.new.play(PAPER, PAPER)
    assert_equal(PAPER, result.gesture1)
    assert_equal(PAPER, result.gesture1)
  end
  def test_scissors_tie_with_scissores()
    result = Game.new.play(SCISSORS, SCISSORS)
    assert_equal(SCISSORS, result.gesture1)
    assert_equal(SCISSORS, result.gesture1)
  end
end
