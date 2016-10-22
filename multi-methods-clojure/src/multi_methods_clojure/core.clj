(ns multi-methods-clojure.core)

(defrecord Win [winner loser])
(defrecord Tie [gesture])

; called with {:gesture :rock|:paper|:scissors :player :player1|player2}
(defmulti play (fn [gesture1 gesture2] [(:gesture gesture1) (:gesture gesture2)]))
(defmethod play [:rock :paper]
  [gesture1 gesture2]
  (Win. gesture2 gesture1))
(defmethod play [:rock :scissors]
  [gesture1 gesture2]
  (Win. gesture1 gesture2))
(defmethod play [:rock :rock]
  [gesture1 gesture2]
  (Tie. (:gesture gesture1)))
(defmethod play [:paper :scissors]
  [gesture1 gesture2]
  (Win. gesture2 gesture1))
(defmethod play [:paper :paper]
  [gesture1 gesture2]
  (Tie. (:gesture gesture1)))
(defmethod play [:scissors :scissors]
  [gesture1 gesture2]
  (Tie. (:gesture gesture1)))
(defmethod play :default
  [gesture1 gesture2]
  (play gesture2 gesture1))
