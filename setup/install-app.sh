# build and install the application

PACKAGE="WARPX"
# make a lower case version of the package 
PACKAGEDIR=`echo "$PACKAGE" | awk '{print tolower($0)}'`

echo "--------------------------------------------------"
echo "PTN: building $PACKAGE"
echo "--------------------------------------------------"

mkdir $PACKAGEDIR 
pushd $PACKAGEDIR

git clone https://github.com/ECP-WarpX/WarpX.git
git clone https://bitbucket.org/berkeleylab/picsar.git
git clone --branch development https://github.com/AMReX-Codes/amrex.git

pushd WarpX

module load gcc
module load cuda

make -j 16 COMP=gcc USE_GPU=TRUE 

popd
popd
