#!/bin/sh

#
# Helper script to run ic3po and save results easily.
#
# Usage: ./ic3po.sh <specname> <specfile> [save]
#

set -e

# specname="consensus_epr_seq"
specname=$1
# specfile="my_examples/consensus_epr/consensus_epr_seq.ivy"
specfile=$2
results_dir="results"
stdoutfile="$results_dir/stdout.txt"

echo "specname: $specname"
echo "specfile: $specfile"
echo "stdoutfile: $stdoutfile"

# Run ic3po at high verbosity and save stdout to a file.
cmd="python ic3po.py -v 5 -o $results_dir -n $specname $specfile"
$cmd 2>&1 >/dev/null | tee $stdoutfile

# Optionally save the results of the run to saved results directory.
if [[ ! -z "$3" && "$3" == "save" ]]
    then
        DATESTR=`date "+%Y-%m-%d_T_%H_%M_%S"`
        saved_results_dir="saved-results/${specname}_${DATESTR}"
        echo "saved results to: $saved_results_dir"
        # mkdir $saved_results_dir
        cp -r "$results_dir/$specname" $saved_results_dir
        echo "cmd: $cmd" > $saved_results_dir/stdout.txt
        cat $results_dir/stdout.txt >> $saved_results_dir/stdout.txt
    else
        echo "not saving ic3po result."
fi

