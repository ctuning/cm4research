#!/bin/bash

CUR_DIR=${PWD}

echo ""
echo "Current execution path: ${CUR_DIR}"
echo "Path to script: ${CM_TMP_CURRENT_SCRIPT_PATH}"

echo "${CM_ARTIFACT_CLOCKHANDS_EXTRACTED}"

cd ${CM_ARTIFACT_CLOCKHANDS_EXTRACTED}/Clockhands_Artifact_MICRO2023/ClockhandsEvaluation


cd A-riscv/
git clone https://github.com/riscv-collab/riscv-gnu-toolchain

cd riscv-gnu-toolchain/

git checkout 2022.01.17
sudo apt install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev
CFLAGS="-O2 -static" ./configure --prefix=$(echo ~/riscv_gcc111) --with-arch=rv64g
make linux -j$(nproc)
make -j$(nproc)
cd ../

cd musl/
CC=~/riscv_gcc111/bin/riscv64-unknown-linux-gnu-gcc CROSS_COMPILE=~/riscv_gcc111/bin/riscv64-unknown-linux-gnu- ./configure --prefix=$(echo ~/musl-gcc) --target=riscv64
make -j$(nproc)
make install
cd ../../

wget https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.1/clang+llvm-12.0.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz
tar xf clang+llvm-12.0.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz
mv clang+llvm-12.0.1-x86_64-linux-gnu-ubuntu- clang+llvm-12.0.1-x86_64-linux-gnu-ubuntu-16.04

cd A-riscv/coremark/
make
cd ../../

cd B-straight/toolchain/Test/coremark/
make
cd ../../../../

cd C-clockhands/coremark/
make
cd ../../

cd onikiri2/project/gcc/
make -j
cd ../../../

cp A-riscv/coremark/rvbin/coremark.rvbin evaluation/0.coremark
cp B-straight/toolchain/Test/coremark/stbin/coremark.stbin evaluation/0.coremark
cp C-clockhands/coremark/chbin/coremark.chbin evaluation/0.coremark
cp onikiri2/project/gcc/onikiri2/a.out evaluation/onikiri2

test $? -eq 0 || exit 1

