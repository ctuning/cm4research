#!/bin/bash

CUR_DIR=${PWD}

echo ""
echo "Current execution path: ${CUR_DIR}"
echo "Path to script: ${CM_TMP_CURRENT_SCRIPT_PATH}"

echo "${CM_GIT_REPO_FPSG_UIUC_TEAAL_CHECKOUT_PATH}"
cd ${CM_GIT_REPO_FPSG_UIUC_TEAAL_CHECKOUT_PATH}

echo "TBD: call script to install deps and set Docker"

test $? -eq 0 || exit 1

