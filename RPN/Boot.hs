module RPN.Boot ( runDefault, rpnCalc ) where

import qualified HConf
import Paths_rpnCalc
import System.IO
import RPN.Main

loadState :: FilePath -> IO State
loadState p = readFile p >>= return . read

saveState :: FilePath -> State -> IO ()
saveState p = writeFile p . show

showError :: String -> Config -> Config
showError msg conf = conf {banner = msg}

runDefault :: IO ()
rpnCalc    :: Config -> IO ()
restart    :: State  -> IO ()
HConf.HConf runDefault rpnCalc restart = HConf.getHConf confParams
                                                        defaultConfig
                                                        defaultState

confParams :: HConf.HConfParams Config State
confParams  = HConf.HConfParams
    { HConf.projectName      = "rpnCalc"
    , HConf.recoverState     = loadState
    , HConf.saveState        = saveState
    , HConf.showErrorsInConf = showError
    , HConf.realMain         = realMain restart
    , HConf.ghcFlags         = []
    , HConf.binDirFn         = getBinDir
    }
