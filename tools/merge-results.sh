#!/bin/bash

set -e

# the first argument is the output filename
OUTPUT=$1
shift

# the rest of the arguments are the inputs
cat "$@" >$OUTPUT

