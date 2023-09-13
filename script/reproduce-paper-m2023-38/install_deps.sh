#!/bin/bash

CUR_DIR=${PWD}

echo ""
echo "Current execution path: ${CUR_DIR}"
echo "Path to script: ${CM_TMP_CURRENT_SCRIPT_PATH}"

sudo apt-get update
sudo apt install flex bison tmux python3-pip
pip3 install matplotlib networkx pandas PyPDF2
