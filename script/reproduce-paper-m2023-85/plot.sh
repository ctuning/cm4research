#!/bin/bash

CUR_DIR=${PWD}

echo ""
echo "Current execution path: ${CUR_DIR}"
echo "Path to script: ${CM_TMP_CURRENT_SCRIPT_PATH}"
echo "ENV CM_EXPERIMENT: ${CM_EXPERIMENT}"



cd ${CM_GIT_REPO_PHOTON_CHECKOUT_PATH}
sh ./script/produce-plots/produce_plots.sh  
#echo ""
#${CM_PYTHON_BIN_WITH_PATH} ${CM_TMP_CURRENT_SCRIPT_PATH}/main.py
#test $? -eq 0 || exit 1
