#!/bin/bash
# the Whisper model to use
model="base.en"

# export the path to the whisper.cpp repo in the WHISPER_CPP_HOME env variable
# https://github.com/ggerganov/whisper.cpp
WHISPER_CPP_HOME=$(dirname "${BASH_SOURCE[0]}")/whisper.cpp
cd "${WHISPER_CPP_HOME}" || exit

if [ ! -f ./stream ] ; then
    echo "whisper.sh: the 'stream' executable was not found! WHISPER_CPP_HOME=${WHISPER_CPP_HOME}" > /tmp/whisper.nvim
    exit 1
fi

if [ ! -f ./models/ggml-${model}.bin ] ; then
    echo "whisper.sh: the '$model' model was not found! WHISPER_CPP_HOME=${WHISPER_CPP_HOME}" > /tmp/whisper.nvim
    exit 2
fi

tmpFile=/tmp/whisper.text
# fine-tune the parameters according to your machine specs
./stream -t 8 -m models/"ggml-${model}.bin" --step 2000 -f "${tmpFile}" 2> /dev/null
exit
