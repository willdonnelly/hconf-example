module RPN.Config
  ( Config(..)
  , defaultConfig
  ) where

import RPN.State

data Config = Config { banner :: String
                     , prompt :: String }

defaultConfig :: Config
defaultConfig = Config { banner = "RPN Calculator\n"
                       , prompt = "> " }
