#!/bin/bash

CUR_DIR=${PWD}

echo ""
echo "Current execution path: ${CUR_DIR}"
echo "Path to script: ${CM_TMP_CURRENT_SCRIPT_PATH}"
echo "ENV CM_EXPERIMENT: ${CM_EXPERIMENT}"

echo "${CM_GIT_REPO_FPSG_UIUC_TEAAL_CHECKOUT_PATH}"

echo "TBD: plot results"

test $? -eq 0 || exit 1

