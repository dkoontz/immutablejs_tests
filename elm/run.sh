#!/bin/bash

elm-make src/CommitMessageStore.elm --output build/CommitMessageStore.js && node build/index.js
