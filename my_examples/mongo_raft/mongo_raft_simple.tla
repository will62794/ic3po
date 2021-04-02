---- MODULE mongo_raft_simple ----
EXTENDS TLC, FiniteSets, Naturals

CONSTANT Server

VARIABLE leader
VARIABLE currentTerm

Quorums == {i \in SUBSET(Server) : Cardinality(i) * 2 > Cardinality(Server)}

BecomeLeader(i, Q, T) ==
    /\ T > currentTerm[i] 
    /\ i \in Q
    /\ \A v \in Q : T > currentTerm[v]
    /\ currentTerm' = [s \in Server |-> IF s \in Q THEN T ELSE currentTerm[s]]
    /\ leader' = [s \in Server |-> IF s = i THEN TRUE ELSE IF s \in Q THEN FALSE ELSE leader[s]]

Init == 
    /\ leader = [i \in Server |-> FALSE]
    /\ currentTerm = [i \in Server |-> 0]

Next == \E i \in Server, Q \in Quorums : BecomeLeader(i, Q, currentTerm[i] + 1)

CONSTANT MaxTerm
Constraint == \A s \in Server : currentTerm[s] < MaxTerm

Inv == \A s,t \in Server : (leader[s] /\ leader[t] /\ s # t) => (currentTerm[s] # currentTerm[t])

TypeOK ==
    /\ leader \in [Server -> BOOLEAN]
    /\ currentTerm \in [Server -> Nat]

Terms == Nat

\* Manually generated inductive strengthening assertion.
A1_Human == 
    \A s \in Server : leader[s] => 
    (\E Q \in Quorums : \A v \in Q : currentTerm[v] >= currentTerm[s])

\* IC3PO generated inductive strengthening assertion.
A1_IC3PO == 
    \forall Q \in Quorums :
    \E s0 \in Server :
    \A s1 \in Server :
    \A t0,t1 \in Terms :
        ( (currentTerm[s0] = t0 \/ (s1 = s0)) /\ (currentTerm[s1] = t1) ) =>
          (t1 <= t0 \/ s1 \in Q)

\* case s1 # s0
\* s1 has term t1
\* s0 has term t0
\* implies
\* t1 <= t0 or s1 \in Q

\* case s1 = s0
\* s0 at t1
\* s0 at t0 or s1 = s0  .... evaluates to FALSE ?
\* implies
\* t1 <= t0 or s1 \in Q

IInv == 
    /\ TypeOK
    /\ Inv
    \* /\ A1
    /\ A1_IC3PO


====