#!/bin/sh

#
# Helper script to run ic3po easily.
#
# Usage: ./ic3po.sh <specname> <specfile>
#
# After running this script, you can save the results by running 
# the accompanying script: ic3po_save.sh <specname>
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

# Run ic3po at high verbosity and save stdout to a file. We redirect stderr to stdout to allow this.
cmd="python ic3po.py -v 5 -o $results_dir -n $specname $specfile"
echo "cmd: $cmd" > $stdoutfile
$cmd 2>&1 >/dev/null | tee -a $stdoutfile