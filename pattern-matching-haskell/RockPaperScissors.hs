module RockPaperScissors
(
  play,
  Player(..),
  Gesture(..),
  Result(..)
) where

data Player = Player Int deriving (Eq, Show)
data Gesture = Rock Player| Paper Player| Scissors Player deriving (Eq, Show)
data Result = Win {winner :: Gesture, loser :: Gesture} | Tie Gesture Gesture deriving (Eq, Show)

play :: Gesture -> Gesture -> Result
play (Rock p1) (Paper p2) = Win {winner = (Paper p2), loser = (Rock p1)}
play (Rock p1) (Scissors p2) = Win {winner = (Rock p1), loser = (Scissors p2)}
play (Rock p1) (Rock p2) = Tie (Rock p1) (Rock p2)
play (Paper p1) (Scissors p2) = Win {winner = (Scissors p2), loser = (Paper p1)}
play (Paper p1) (Paper p2) = Tie (Paper p1) (Paper p2)
play (Scissors p1) (Scissors p2) = Tie (Scissors p1) (Scissors p2)
play (g1) (g2) = play g2 g1 -- using commutative property here
