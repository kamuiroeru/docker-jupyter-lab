#!/bin/bash

cd `dirname $0`

PORT=8888
DIR_PATH=`pwd`/home

docker run -d --rm -p $PORT:8888 -v $DIR_PATH:/work kamuiroeru/jupyter-lab
