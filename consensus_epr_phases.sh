#!/bin/sh

set -e

# Concatenation of all phase invariants.
finalinvfile="results/consensus_epr_phases.inv"
printf "" > $finalinvfile

# The initial finite parameters for ic3po. Use the same for all phases.
node="2"
quorum="2"
value="2"
sizes="$node\n$quorum\n$value"

# PHASE 1

echo "--- RUNNING PHASE 1 ---"
specname="consensus_epr_seq_phase1_sendVote"
cmd="python ic3po.py -v 5 -o results -n $specname my_examples/consensus_epr/$specname.ivy"
echo $sizes | $cmd
invfile="results/$specname/$specname.inv"
echo "### (PHASE 1, sendVote)" >> $finalinvfile
printf "### phase invariant: " >> $finalinvfile
grep "invariant.*safety" my_examples/consensus_epr/$specname.ivy >> $finalinvfile
cat $invfile | sed -E "s/ic3po_/phase1_/" | grep -v "##" >> $finalinvfile
echo "" >> $finalinvfile

# PHASE 2

# The initial finite parameters for ic3po.
echo "--- RUNNING PHASE 2 ---"
specname="consensus_epr_seq_phase2_recvVote"
cmd="python ic3po.py -v 5 -o results -n $specname my_examples/consensus_epr/$specname.ivy"
echo $sizes | $cmd
invfile="results/$specname/$specname.inv"
echo "### (PHASE 2, recvVote)" >> $finalinvfile
printf "### phase invariant: " >> $finalinvfile
grep "invariant.*safety" my_examples/consensus_epr/$specname.ivy >> $finalinvfile
cat $invfile | sed -E "s/ic3po_/phase2_/" | grep -v "##" >> $finalinvfile
echo "" >> $finalinvfile


# PHASE 3

# The initial finite parameters for ic3po.
echo "--- RUNNING PHASE 3 ---"
specname="consensus_epr_seq_phase3_becomeLeader"
cmd="python ic3po.py -v 5 -o results -n $specname my_examples/consensus_epr/$specname.ivy"
echo $sizes | $cmd
invfile="results/$specname/$specname.inv"
echo "### (PHASE 3, becomeLeader)" >> $finalinvfile
printf "### phase invariant: " >> $finalinvfile
grep "invariant.*safety" my_examples/consensus_epr/$specname.ivy >> $finalinvfile
cat $invfile | sed -E "s/ic3po_/phase3_/" | grep -v "##" >> $finalinvfile
echo "" >> $finalinvfile


# PHASE 4

# The initial finite parameters for ic3po.
echo "--- RUNNING PHASE 4 ---"
specname="consensus_epr_seq_phase4_decide"
cmd="python ic3po.py -v 5 -o results -n $specname my_examples/consensus_epr/$specname.ivy"
echo $sizes | $cmd
invfile="results/$specname/$specname.inv"
echo "### (PHASE 4, decide)" >> $finalinvfile
printf "### phase invariant: " >> $finalinvfile
grep "invariant.*safety" my_examples/consensus_epr/$specname.ivy >> $finalinvfile
cat $invfile | sed -E "s/ic3po_/phase4_/" | grep -v "##" >> $finalinvfile
echo "" >> $finalinvfile

# Save version of consensus_epr with the full concatenation of all phase invariants.
outfile="results/consensus_epr_with_phase_inv.ivy"
grep -v "invariant \[" my_examples/consensus_epr/consensus_epr.ivy > $outfile
echo "" >> $outfile

# # Concatenated version of the invariant.
# echo "# Complete phase generated invariant." >> $outfile
# printf "invariant [safety] " >> $outfile
# grep "invariant.*phase" $finalinvfile | sed -E "s/invariant.*phase.*\]//" | tr '\n' '&' | sed 's/&$//'>> $outfile

# Split up version of the invariant.
cat $finalinvfile >> $outfile


# Check generated inductive invariant with Ivy.
# ivy_check complete=fo results/consensus_epr_with_phase_inv.ivy