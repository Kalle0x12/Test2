#!/bin/bash
set -ex
#git clone https://github.com/pybind/pybind11.git
#cd pybind11
wget https://github.com/pybind/pybind11/archive/v2.2.3.tar.gz
mkdir pybind11
tar xf v2.2.3.tar.gz -C pybind11 --strip 1
cd pybind11
export CMAKE_EXTRA_ARGS=$3
export CMAKE_INCLUDE_PATH=$4
cmake  -DPYBIND11_PYTHON_VERSION=$1 -DPYBIND11_CPP_STANDARD=$2 -DPYBIND11_WERROR=OFF -DDOWNLOAD_CATCH=ON
make -j2 pytest
