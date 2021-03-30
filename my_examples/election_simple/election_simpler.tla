---- MODULE election_simpler ----
EXTENDS TLC, Naturals, FiniteSets

CONSTANT Server
CONSTANT Nil

VARIABLE leader
VARIABLE currentTerm

\* Next term that can be used by a leader. Monotonically
\* increasing value.
VARIABLE nextTerm

BecomeLeader(i) == 
    /\ currentTerm' = [currentTerm EXCEPT ![i] = nextTerm]
    /\ leader' = [leader EXCEPT ![i] = TRUE]
    /\ nextTerm' = nextTerm + 1

Next == \E i \in Server : BecomeLeader(i)

Init == 
    /\ leader = [i \in Server |-> FALSE]
    /\ currentTerm = [i \in Server |-> 0]
    /\ nextTerm = 1

Inv == \A s,t \in Server : (leader[s] /\ leader[t] /\ s # t) => (currentTerm[s] # currentTerm[t])

CONSTANT MaxTerm
Constraint == \A s \in Server : nextTerm < MaxTerm

TypeOK == 
    /\ leader \in [Server -> BOOLEAN]
    /\ currentTerm \in [Server -> Nat]
    /\ nextTerm \in Nat

\* \* Inductive invariant.
IInv == 
    /\ TypeOK 
    /\ Inv
    \* If you are currently a primary in term T, then the 'nextTerm' must have been
    \* advanced to a newer term.
    /\ \A s \in Server : leader[s] => nextTerm > currentTerm[s]

====