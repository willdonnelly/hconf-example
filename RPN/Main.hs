module RPN.Main ( realMain ) where

import RPN.State
import RPN.Config

realMain :: (State -> IO ()) -> Config -> State -> IO ()
realMain restart config state = putStrLn "Hello, world!"
