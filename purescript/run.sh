#!/bin/bash

export NODE_PATH=$NODE_PATH:./output
pulp build && node index.js
# pulp build --to output.js && node output.js
