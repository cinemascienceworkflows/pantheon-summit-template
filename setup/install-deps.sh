#!/bin/bash -l

# adding comment

source ./pantheon/env.sh

echo "PTN: Establishing Pantheon workflow directory:"
echo $PANTHEON_WORKFLOW_DIR

PANTHEON_SOURCE_ROOT=$PWD

# build serial or parallel
    # serial
# BUILD_FLAGS=""
    # parallel
BUILD_FLAGS="-j"

# these settings allow you to control what gets built ... 
BUILD_CLEAN=true
BUILD_APP=true

# other variables

# install locations

# commits

# ---------------------------------------------------------------------------
#
# Build things, based on flags set above
#
# ---------------------------------------------------------------------------

# if a clean build, remove everything
if $BUILD_CLEAN; then
    echo "------------------------------------------------------------"
    echo "PTN: clean build ..."
    echo "------------------------------------------------------------"
    if [ -d $PANTHEON_WORKFLOW_DIR ]; then
        rm -rf $PANTHEON_WORKFLOW_DIR
    fi
    if [ ! -d $PANTHEONPATH ]; then
        mkdir $PANTHEONPATH
    fi
    mkdir $PANTHEON_WORKFLOW_DIR
    mkdir $PANTHEON_DATA_DIR
fi

# build the application and parts as needed
if $BUILD_APP; then
    pushd $PANTHEON_WORKFLOW_DIR
    pwd

    source $PANTHEON_SOURCE_ROOT/setup/install-app.sh

    popd
fi

