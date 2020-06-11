![research](https://pantheonscience.github.io/states/research.png)

# Pantheon Workflow Template v 1.0

A repository template for the Pantheon project workflows on summit.

## Using this repository

When the workflow is run, the following files will be run in this order:

1. `setup/install-deps.sh`
    - `setup/install-app.sh` (called from the above script)
1. `run/run.sh` (this submits the job)
1. `run/wait_for_completion.sh`
1. `postprocessing/postprocessing.sh`

## Edit these files

1. `bootstrap.env` - edit the `SUMMIT_ALLOCATION` variable value to reflect your allocation
1. `pantheon/pantheon.yml` - edit this to reflect the information from Pantheon for your workflow 
1. 


## DO NOT edit these files

1. `main.workflow`
1. `pantheon/pantheon.env`
