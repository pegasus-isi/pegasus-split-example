#!/bin/bash

set -e

START_DIR=`pwd`

RUN_DIR=$1
INPUT_FILE=$2

# target directory for the chunks
mkdir -p $RUN_DIR/chunks

# here we just use the Linux split command - this can 
# be changed out against whatever split code you need
cd $RUN_DIR/chunks
split --lines=100 $START_DIR/$INPUT_FILE chunk-


