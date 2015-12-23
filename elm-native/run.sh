#!/bin/bash

elm-make src/Main.elm --output build/Main.js && node src/index.js
