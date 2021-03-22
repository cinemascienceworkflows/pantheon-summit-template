#!/bin/bash -l

START_TIME=$(date +"%r %Z")
source ./pantheon/env.sh > /dev/null 2>&1

echo "------------------------------------------------------------"
echo "PTN: Establishing Pantheon workflow directory:"
echo $PANTHEON_WORKFLOW_DIR
echo "------------------------------------------------------------"

PANTHEON_SOURCE_ROOT=$PWD

# these settings allow you to control what gets built ... 
BUILD_CLEAN=true
INSTALL_APP=true

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
    mkdir $PANTHEON_RUN_DIR
fi


# build the application and parts as needed
if $INSTALL_APP; then
    echo "------------------------------------------------------------"
    echo "PTN: installing app ..."
    echo "------------------------------------------------------------"

    source $PANTHEON_SOURCE_ROOT/setup/install-app.sh
fi

END_TIME=$(date +"%r %Z")
echo "------------------------------------------------------------"
echo "PTN: install-deps" 
echo "PTN: start: $START_TIME"
echo "PTN: end  : $END_TIME"
echo "------------------------------------------------------------"

