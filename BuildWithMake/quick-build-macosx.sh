#/bin/bash

export EXTERNALS_TOP=`pwd`/ext

export PARENT_URL=http://simvascular.stanford.edu/downloads/public/simvascular/externals/mac_osx/10.12/clang-7.3/2016.12.13

# default is windows, so override with gnu compilers and mac_osx

echo "CLUSTER=x64_macosx" > cluster_overrides.mk
echo "CXX_COMPILER_VERSION=clang" >> cluster_overrides.mk

echo "FORTRAN_COMPILER_VERSION=ifort" >> cluster_overrides.mk

echo "OPEN_SOFTWARE_BINARIES_TOPLEVEL=$EXTERNALS_TOP/bin" >> global_overrides.mk
echo "OPEN_SOFTWARE_BUILDS_TOPLEVEL=$EXTERNALS_TOP/build" >> global_overrides.mk
echo "OPEN_SOFTWARE_SOURCES_TOPLEVEL=$EXTERNALS_TOP/src" >> global_overrides.mk
echo "LICENSED_SOFTWARE_TOPLEVEL=" >> global_overrides.mk

sudo mkdir -p $EXTERNALS_TOP
sudo chmod -R a+rwx $EXTERNALS_TOP
mkdir -p $EXTERNALS_TOP/tarfiles
mkdir -p $EXTERNALS_TOP/bin

pushd $EXTERNALS_TOP/tarfiles
wget $PARENT_URL/mac_osx.clang-7.0.x64.freetype-2.6.3-BUILD2016-12-13.tar.gz
wget $PARENT_URL/mac_osx.clang-7.0.x64.gdcm-2.6.1-BUILD2016-12-13.tar.gz
wget $PARENT_URL/mac_osx.clang-7.0.x64.itk-4.7.1-BUILD2016-12-13.tar.gz
wget $PARENT_URL/mac_osx.clang-7.0.x64.mitk-2016.03-BUILD2016-12-13.tar.gz
wget $PARENT_URL/mac_osx.clang-7.0.x64.mmg-5.1.0-BUILD2016-12-13.tar.gz
wget $PARENT_URL/mac_osx.clang-7.0.x64.opencascade-7.0.0-BUILD2016-12-13.tar.gz
wget $PARENT_URL/mac_osx.clang-7.0.x64.python-2.7.11-BUILD2016-12-13.tar.gz
wget $PARENT_URL/mac_osx.clang-7.0.x64.tcltk-8.6.4-BUILD2016-12-13.tar.gz
wget $PARENT_URL/mac_osx.clang-7.0.x64.vtk-6.2.0-BUILD2016-12-13.tar.gz
popd

pushd $EXTERNALS_TOP/bin
for i in $EXTERNALS_TOP/tarfiles/mac_osx.clang-7.0.x64.*.tar.gz; do
    tar xvzf $i
done
popd

make
