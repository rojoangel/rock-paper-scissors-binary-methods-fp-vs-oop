class Player
  attr_reader :i
  def initialize(i)
    @i = i
  end
end

class Gesture
  attr_reader :player
  def initialize(player)
    @player = player
  end
end

class Rock < Gesture
  def play_against(other)
    other.play_against_rock(self)
  end
  def play_against_rock(rock)
    Tie.new(self, rock)
  end
  def play_against_scissors(scissors)
    Win.new(self, scissors)
  end
  def play_against_paper(paper)
    paper.play_against_rock(self)
  end
end

class Paper < Gesture
  def play_against(other)
    other.play_against_paper(self)
  end
  def play_against_rock(rock)
    Win.new(self, rock)
  end
  def play_against_scissors(scissors)
    scissors.play_against_paper(self)
  end
  def play_against_paper(paper)
    Tie.new(self, paper)
  end
end

class Scissors < Gesture
  def play_against(other)
    other.play_against_scissors(self)
  end
  def play_against_rock(rock)
    rock.play_against_scissors(self)
  end
  def play_against_scissors(scissors)
    Tie.new(self, scissors)
  end
  def play_against_paper(paper)
    Win.new(self, paper)
  end
end

class Result
end

class Win < Result
  attr_reader :winner, :loser
  def initialize(winner, loser)
    @winner = winner
    @loser = loser
  end
end

class Tie < Result
  attr_reader :gesture1, :gesture2
  def initialize(gesture1, gesture2)
    @gesture1 = gesture1
    @gesture2 = gesture2
  end
end

class Game
  def play(gesture1, gesture2)
    gesture1.play_against(gesture2)
  end
end
