#!/bin/bash

#BSUB -J <pantheon_workflow_jid> 
#BSUB -P <compute_allocation> 

# --------------------------------------------------------------------
# BEGIN: EDIT THIS SECTION
#     add the bsub settings, modules and execution for your application
#BSUB -P <compute_allocation>
#BSUB -J <pantheon_workflow_jid> 
#BSUB -W 0:03
#BSUB -nnodes 1

# load modules required by the executable

# submit the job
jsrun executable-to-run 
# END: EDIT THIS SECTION
# --------------------------------------------------------------------

