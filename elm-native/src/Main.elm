module Main where

import TestModule exposing (getRandom)
import Graphics.Element exposing (show)
-- import Debug exposing (log)
main = show <| getRandom ()
-- unsafeShowMessage = log "hello"


-- main = log "hello"
