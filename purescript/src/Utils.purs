module Utils((|>)) where

import Prelude

(|>) :: forall t1 t2. t2 -> (t2 -> t1) -> t1
(|>) =  flip ($)
