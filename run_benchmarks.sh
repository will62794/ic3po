set -e
bmfile="benchmark_results.csv"
echo "protocol,duration_secs,invsize" > $bmfile
runbm () {
    bmname=$1
    type=$2
    name=$3
    args=$4
    echo "Running benchmark '$type,$name'"

    start=$SECONDS
    echo $args | python ic3po.py --opt 0 -v 5 -o results -n $name  ivybench/$type/ivy/$name.ivy
    end=$SECONDS
    dur=$((end - start))

    # Measure discovered invariant size.
    invfile="results/$name/$name.inv"
    num_inv_conjuncts=`grep -v -c "###" $invfile`

    echo "Duration secs: $dur"
    echo "$bmname,$dur,$num_inv_conjuncts" >> benchmark_results.csv
}

runbm "tla-consensus" "tla" "Consensus" "2\n2"
runbm "tla-tcommit" "tla" "TCommit" "2\n2"
runbm "i4-lock-server" "i4" "lock_server" "2\n2"
runbm "ex-quorum-leader-election" "ex" "quorum-leader-election" "2\n2"
runbm "pyv-toy-consensus-forall" "mypyv" "toy_consensus_forall" "2\n2\n2"
runbm "tla-simple" "tla" "Simple" "2\n6\n2"
runbm "ex-lockserv-automaton" "ex" "lockserv_automaton" "2"
runbm "tla-simpleregular" "tla" "SimpleRegular" "2\n6\n2"
runbm "pyv-sharded-kv" "mypyv" "sharded_kv" "2\n2\n2"
runbm "pyv-lockserv" "mypyv" "lockserv" "2"
runbm "tla-twophase" "tla" "TwoPhase" "2"
runbm "i4-learning-switch" "i4" "learning_switch" "2\n2"
runbm "ex-simple-decentralized-lock" "ex" "simple-decentralized-lock" "2"
runbm "i4-two-phase-commit" "i4" "two_phase_commit" "2"
runbm "pyv-consensus-wo-decide" "mypyv" "consensus_wo_decide" "2\n2"
runbm "pyv-consensus-forall" "mypyv" "consensus_forall" "2\n2\n2"
runbm "pyv-learning-switch" "mypyv" "learning_switch" "2"
runbm "i4-chord-ring-maintenance" "i4" "chord_ring_maintenance" "2"
runbm "pyv-sharded-kv-no-lost-keys" "mypyv" "sharded_kv_no_lost_keys" "2\n2\n2"
runbm "ex-naive-consensus" "ex" "naive_consensus" "2\n2\n2"
runbm "pyv-client-server-ae" "mypyv" "client_server_ae" "2\n2\n2"
runbm "ex-simple-election" "ex" "simple-election" "2\n2\n2"
runbm "pyv-toy-consensus-epr" "mypyv" "toy_consensus_epr" "2\n2\n2"
runbm "ex-toy-consensus" "ex" "toy_consensus" "2\n2\n2"
runbm "pyv-client-server-db-ae" "mypyv" "client_server_db_ae" "2\n2\n2\n2"
runbm "pyv-hybrid-reliable-broadcast" "mypyv" "hybrid_reliable_broadcast" "2\n2\n2"
runbm "pyv-firewall" "mypyv" "firewall" "2"
runbm "ex-majorityset-leader-election" "ex" "majorityset_leader_election" "2\n2"
runbm "pyv-consensus-epr" "mypyv" "consensus_epr" "2\n2\n2"
# runbm "tla" "mongo-logless-reconfig" "2\n2"




# echo "2\n2" | python ic3po.py --opt 0 -v 5 -o results -n lock_server  ivybench/tla/ivy/TCommit.ivy


# echo "2\n2" | python ic3po.py --opt 0 -v 5 -o results -n lock_server ivybench/i4/ivy/lock_server.ivy
