#!/bin/sh

#
# Helper script to save ic3po results into separate directory. Can run this after
# running the ic3po.sh script to generate the results. 
#
# Usage: ./ic3po_save.sh <specname>
#

set -e

specname=$1
results_dir="results"
stdoutfile="$results_dir/stdout.txt"

echo "specname: $specname"
echo "stdoutfile: $stdoutfile"

DATESTR=`date "+%Y-%m-%d_T_%H_%M_%S"`
saved_results_dir="saved-results/${specname}_${DATESTR}"
echo "saved results to: $saved_results_dir"
cp -r "$results_dir/$specname" $saved_results_dir
# echo "cmd: $cmd" > $saved_results_dir/stdout.txt
cat $results_dir/stdout.txt > $saved_results_dir/stdout.txt

