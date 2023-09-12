#!/bin/bash

CUR_DIR=${PWD}

echo ""
echo "Current execution path: ${CUR_DIR}"
echo "Path to script: ${CM_TMP_CURRENT_SCRIPT_PATH}"

echo "Changing to XFM repo: ${CM_GIT_REPO_XFM_CHECKOUT_PATH}"
cd ${CM_GIT_REPO_XFM_CHECKOUT_PATH}

echo ""

cd xfm_access_model

python3 xfm_access_model.py
test $? -eq 0 || exit 1

mkdir -p ../results/xfm_access_model

cp XFM_Access_Distribution.png ../results/xfm_access_model
cp XFM_Access_Distribution.png ${CUR_DIR}
