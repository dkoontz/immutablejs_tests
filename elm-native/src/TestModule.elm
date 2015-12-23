module TestModule (getRandom) where

-- imports are weird for Native modules
-- You import them as you would normal modules
-- but you can't alias them nor expose stuff from them
import Native.TestModule

-- this will be our function which gets a random number
-- It will just take a `()`. This is to signify that it
-- is impure
getRandom : () -> Float
getRandom = Native.TestModule
