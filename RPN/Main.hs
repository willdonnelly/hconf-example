module RPN.Main
  ( realMain
  , State  (..), defaultState
  , Config (..), defaultConfig
  ) where

import System.IO

data State = State { numStack :: [Int] } deriving (Read, Show)
defaultState = State { numStack = [] }

data Config = Config { banner :: String
                     , prompt :: String
                     , functions :: [(String, [Int] -> [Int])]
                     }
defaultConfig = Config { banner = "RPN Calculator"
                       , prompt = "> "
                       , functions = [ ("+", addStack)
                                     , ("-", subStack)
                                     ]
                       }

realMain :: (State -> IO ()) -> Config -> State -> IO ()
realMain restart config state = do
    putStrLn . banner $ config
    putStrLn ""
    realMain' . numStack $ state
  where realMain' stack = do
            putStr (showPrompt stack) >> hFlush stdout
            input <- getLine
            case input of
                 "q" -> return ()
                 "r" -> restart . State $ stack
                 str -> realMain' .  pushStack config str $ stack
        showPrompt stack = "[" ++ stackString ++ "]" ++ prompt config
            where stackString = unwords . map show . reverse $ stack

pushStack :: Config -> String -> [Int] -> [Int]
pushStack cfg str stack =
    case str `lookup` (functions cfg) of
         Just fn -> fn stack
         Nothing -> read str : stack

addStack []       = []
addStack (x:[])   = [x]
addStack (x:y:zs) = x+y:zs

subStack []       = []
subStack (x:[])   = [x]
subStack (x:y:zs) = y-x:zs
