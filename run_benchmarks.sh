set -e
bmfile="benchmark_results.csv"
echo "protocol,duration_secs" > $bmfile
runbm () {
    type=$1
    name=$2
    args=$3
    echo "Running benchmark '$type,$name'"

    start=$SECONDS
    echo $args | python ic3po.py --opt 0 -v 5 -o results -n $name  ivybench/$type/ivy/$name.ivy
    end=$SECONDS
    dur=$((end - start))
    echo "Duration secs: $dur"
    echo "$name,$dur" >> benchmark_results.csv
}

runbm "tla" "Consensus" "2\n2"
runbm "tla" "TCommit" "2\n2"
runbm "i4" "lock_server" "2\n2"
runbm "ex" "quorum-leader-election" "2\n2"
runbm "mypyv" "toy_consensus_forall" "2\n2\n2"
runbm "tla" "Simple" "2\n6\n2"
runbm "ex" "lockserv_automaton" "2"
runbm "tla" "SimpleRegular" "2\n6\n2"
runbm "mypyv" "sharded_kv" "2\n2\n2"
runbm "mypyv" "lockserv" "2"
runbm "tla" "TwoPhase" "2"
runbm "i4" "learning_switch" "2\n2"
runbm "ex" "simple-decentralized-lock" "2"
runbm "i4" "two_phase_commit" "2"
runbm "mypyv" "consensus_wo_decide" "2\n2"
runbm "mypyv" "consensus_forall" "2\n2\n2"
runbm "mypyv" "learning_switch" "2"
runbm "i4" "chord_ring_maintenance" "2"
runbm "mypyv" "sharded_kv_no_lost_keys" "2\n2\n2"
runbm "ex" "naive_consensus" "2\n2\n2"
runbm "mypyv" "client_server_ae" "2\n2\n2"
runbm "ex" "simple-election" "2\n2\n2"
runbm "mypyv" "toy_consensus_epr" "2\n2\n2"
runbm "ex" "toy_consensus" "2\n2\n2"
runbm "mypyv" "client_server_db_ae" "2\n2\n2\n2"
runbm "mypyv" "hybrid_reliable_broadcast" "2\n2\n2"
runbm "mypyv" "firewall" "2"
runbm "ex" "majorityset_leader_election" "2\n2"
runbm "mypyv" "consensus_epr" "2\n2\n2"
# runbm "tla" "mongo-logless-reconfig" "2\n2"




# echo "2\n2" | python ic3po.py --opt 0 -v 5 -o results -n lock_server  ivybench/tla/ivy/TCommit.ivy


# echo "2\n2" | python ic3po.py --opt 0 -v 5 -o results -n lock_server ivybench/i4/ivy/lock_server.ivy
