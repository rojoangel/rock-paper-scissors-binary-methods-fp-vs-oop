(ns multi-methods-clojure.core-test
  (:require [clojure.test :refer :all]
            [multi-methods-clojure.core :refer :all]))

(deftest test-paper-beats-rock
  (testing "paper beats rock"
    (is (= (->Win {:gesture :paper :player :player2} {:gesture :rock :player :player1})
           (play {:gesture :rock :player :player1} {:gesture :paper :player :player2})))
    (is (= (->Win {:gesture :paper :player :player1} {:gesture :rock :player :player2})
           (play {:gesture :paper :player :player1} {:gesture :rock :player :player2}))))
  (testing "rock beats scissors"
    (is (= (->Win {:gesture :rock :player :player1} {:gesture :scissors :player :player2})
           (play {:gesture :rock :player :player1} {:gesture :scissors :player :player2})))
    (is (= (->Win {:gesture :rock :player :player2} {:gesture :scissors :player :player1})
           (play {:gesture :scissors :player :player1} {:gesture :rock :player :player2}))))
  (testing "rock ties with rock"
    (is (= (->Tie :rock)
           (play {:gesture :rock :player :player1} {:gesture :rock :player :player2}))))
  (testing "scissors beat paper"
    (is (= (->Win {:gesture :scissors :player :player2} {:gesture :paper :player :player1})
           (play {:gesture :paper :player :player1} {:gesture :scissors :player :player2})))
    (is (= (->Win {:gesture :scissors :player :player1} {:gesture :paper :player :player2})
           (play {:gesture :scissors :player :player1} {:gesture :paper :player :player2}))))
  (testing "paper ties with paper"
    (is (= (->Tie :paper)
           (play {:gesture :paper :player :player1} {:gesture :paper :player :player2}))))
  (testing "scissors tie with scissors"
    (is (= (->Tie :scissors)
           (play {:gesture :scissors :player :player1} {:gesture :scissors :player :player2})))))
