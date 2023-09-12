#!/bin/bash

CUR_DIR=${PWD}

echo ""
echo "Current execution path: ${CUR_DIR}"
echo "Path to script: ${CM_TMP_CURRENT_SCRIPT_PATH}"

echo "Changing to XFM repo: ${CM_GIT_REPO_XFM_CHECKOUT_PATH}"
cd ${CM_GIT_REPO_XFM_CHECKOUT_PATH}

echo ""

cd memory_channel_interleave_ratios

./run.sh
test $? -eq 0 || exit 1

mkdir -p ../results/memory_channel_interleave_ratios_results

cp results.csv ../results/memory_channel_interleave_ratios_results
test $? -eq 0 || exit 1
