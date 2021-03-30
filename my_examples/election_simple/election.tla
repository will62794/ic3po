---- MODULE election ----
EXTENDS TLC, Naturals, FiniteSets

CONSTANT Server
CONSTANT Nil

VARIABLE leader
VARIABLE currentTerm

\* Majority quorums.
Quorums == {i \in SUBSET(Server) : Cardinality(i) * 2 > Cardinality(Server)}

\* Server i becomes leader with quorum Q in term T
BecomeLeader(i, Q, T) ==
    /\ i \in Q \* vote for yourself.
    /\ \A s \in Q : T > currentTerm[s]
    /\ currentTerm' = [x \in Server |-> IF x \in Q THEN currentTerm[i] + 1 ELSE currentTerm[x]]
    /\ leader' = [x \in Server |-> IF x = i THEN TRUE ELSE IF x \in Q THEN FALSE ELSE leader[x]]

Next == 
    \E i \in Server, Q \in Quorums : BecomeLeader(i, Q, currentTerm[i] + 1)

Init == 
    /\ leader = [i \in Server |-> FALSE]
    /\ currentTerm = [i \in Server |-> 0]

Inv == \A s,t \in Server : (leader[s] /\ leader[t] /\ s # t) => (currentTerm[s] # currentTerm[t])

CONSTANT MaxTerm
Constraint == \A s \in Server : currentTerm[s] < MaxTerm

TypeOK == 
    /\ leader \in [Server -> BOOLEAN]
    /\ currentTerm \in [Server -> Nat]

\* Inductive invariant.
IInv == 
    /\ TypeOK 
    /\ Inv
    \* If you are currently a primary in term T, a quorum must have term T.
    /\ \A s \in Server : 
        leader[s] => 
        (\E Q \in Quorums : \A x \in Q : currentTerm[x] >= currentTerm[s])

====