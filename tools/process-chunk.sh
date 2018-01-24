#!/bin/bash

set -e

INPUT=$1
OUTPUT=${INPUT}.results

# processing in this example is just a simple character count
wc -m $INPUT >$OUTPUT

