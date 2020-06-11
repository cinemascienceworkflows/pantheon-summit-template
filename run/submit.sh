#!/bin/bash

#BSUB -J <pantheon_workflow_jid> 
#BSUB -P <summit_allocation> 
#BSUB -nnodes 8
#BSUB -W 00:10
#BSUB -o WarpXo.%J
#BSUB -e WarpXe.%J

module load gcc
module load cuda

omp=1
export OMP_NUM_THREADS=${omp}

num_nodes=$(( $(printf '%s\n' ${LSB_HOSTS} | sort -u | wc -l) - 1 ))
jsrun -n ${num_nodes} -a 6 -g 6 -c 6 --bind=packed:${omp} ./warpx.exe inputs_3d > output.txt

