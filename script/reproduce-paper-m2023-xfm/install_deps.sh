#!/bin/bash

CUR_DIR=${PWD}

echo ""
echo "Current execution path: ${CUR_DIR}"
echo "Path to script: ${CM_TMP_CURRENT_SCRIPT_PATH}"

echo "Changing to XFM repo: ${CM_GIT_REPO_XFM_CHECKOUT_PATH}"
cd ${CM_GIT_REPO_XFM_CHECKOUT_PATH}

echo ""

git submodule update --init --recursive .
test $? -eq 0 || exit 1

cd memory_channel_interleave_ratios
test $? -eq 0 || exit 1

./build_gzip.sh
test $? -eq 0 || exit 1

./fetch_corpus.sh
test $? -eq 0 || exit 1
