module RockPaperScissors.Test where
import RockPaperScissors
import Test.Hspec

main = hspec $ do
  describe "play" $ do
    it "paper beats rock" $ do
      play (Rock, Player 1) (Paper, Player 2) `shouldBe`
        Win {winner = (Paper, Player 2), loser = (Rock, Player 1)}
      play (Paper, Player 1) (Rock, Player 2) `shouldBe`
        Win {winner = (Paper, Player 1), loser = (Rock, Player 2)}
    it "rock beats scissors" $ do
      play (Rock, Player 1) (Scissors, Player 2) `shouldBe`
        Win {winner = (Rock, Player 1), loser = (Scissors, Player 2)}
      play (Scissors, Player 1) (Rock, Player 2) `shouldBe`
        Win {winner = (Rock, Player 2), loser = (Scissors, Player 1)}
    it "rock ties with rock" $ do
      play (Rock, Player 1) (Rock, Player 2) `shouldBe`
        Tie (Rock, Player 1) (Rock, Player 2)
    it "scissors beats paper" $ do
      play (Paper, Player 1) (Scissors, Player 2) `shouldBe`
        Win {winner = (Scissors, Player 2), loser = (Paper, Player 1)}
      play (Scissors, Player 1) (Paper, Player 2) `shouldBe`
        Win {winner = (Scissors, Player 1), loser = (Paper, Player 2)}
    it "paper ties with paper" $ do
      play (Paper, Player 1) (Paper, Player 2) `shouldBe`
        Tie (Paper, Player 1) (Paper, Player 2)
    it "scissors ties with scissors" $ do
      play (Scissors, Player 1) (Scissors, Player 2) `shouldBe`
        Tie (Scissors, Player 1) (Scissors, Player 2)
