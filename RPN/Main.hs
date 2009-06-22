module RPN.Main
  ( realMain
  , State (..)
  , defaultState
  , Config (..)
  , defaultConfig
  ) where

data State = State { numStack :: [Int] } deriving (Read, Show)

defaultState :: State
defaultState = State { numStack = [] }

data Config = Config { banner :: String
                     , prompt :: String }

defaultConfig :: Config
defaultConfig = Config { banner = "RPN Calculator\n"
                       , prompt = "> " }

realMain :: (State -> IO ()) -> Config -> State -> IO ()
realMain restart config state = putStrLn "Hello, world!"
