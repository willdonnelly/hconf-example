module RPN.State
  ( State(..)
  , defaultState
  ) where

data State = State { numStack :: [Int] } deriving (Read, Show)

defaultState :: State
defaultState = State { numStack = [] }
