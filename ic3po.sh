#!/bin/zsh

#
# Helper script to run ic3po and save results easily.
#
# Usage: ./ic3po.sh <specname> <specfile> [save]
#

specname=$1
specfile=$2
results_dir="results"
stdoutfile="$results_dir/stdout.txt"

# timeout_duration="10m"
# timeout -s 9 $timeout_duration ./ic3po_run.sh $specname $specfile

# Run ic3po.
./ic3po_run.sh $specname $specfile

# Optionally save the results of the run to saved results directory.
if [[ ! -z "$3" && "$3" == "save" ]]
    then
        ./ic3po_save.sh $specname
    else
        echo "not saving ic3po result."
fi