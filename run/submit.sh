#!/bin/bash

#BSUB -J <pantheon_workflow_jid> 
#BSUB -P <summit_allocation> 

# --------------------------------------------------------------------
# BEGIN: EDIT THIS SECTION
#     add the bsub settings, modules and execution for your application
#BSUB -nnodes 8
#BSUB -W 00:10

# load modules required by the executable
module load gcc
module load cuda

# submit the job
jsrun -n 8 executable-to-run 
# END: EDIT THIS SECTION
# --------------------------------------------------------------------

