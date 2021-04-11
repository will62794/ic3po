---- MODULE mongo_raft_simple ----
EXTENDS TLC, FiniteSets, Naturals, Sequences

CONSTANT Server

VARIABLE leader
VARIABLE currentTerm
VARIABLE log
VARIABLE committed

Quorums == {i \in SUBSET(Server) : Cardinality(i) * 2 > Cardinality(Server)}

LastTerm(i) == IF Len(log[i]) = 0 THEN 0 ELSE log[i][Len(log[i])]

\* Comparison between <<index, term>> pairs.
logLTE(it1, it2) ==
    \* different terms. 
    \/ (it1[2] < it2[2])
    \* same terms.
    \/ (it1[2] = it2[2]) /\ (it1[1] <= it2[1])

BecomeLeader(i, Q, T) ==
    /\ \A v \in Q : currentTerm[v] < T
    /\ \A v \in Q : 
        \/ Len(log[v]) = 0
        \/ /\ Len(log[v]) > 0 
           /\ logLTE(<<Len(log[v]),LastTerm(v)>>, <<Len(log[i]),LastTerm(i)>>)

    /\ currentTerm' = [s \in Server |-> IF s \in Q THEN T ELSE currentTerm[s]]
    \* /\ currentTerm' = currentTerm

    /\ leader' = [s \in Server |-> IF s = i THEN TRUE ELSE IF s \in Q THEN FALSE ELSE leader[s]]
    \* /\ leader' = leader
    /\ UNCHANGED <<log,committed>>

ClientRequest(i) == 
    /\ leader[i]

    /\ log' = [log EXCEPT ![i] = Append(log[i], currentTerm[i])]
    \* /\ log' = log

    /\ UNCHANGED <<leader, currentTerm,committed>>

CommitEntry(i, Q) == 
    /\ leader[i]
    /\ Len(log[i]) > 0
    /\ \A s \in Q : 
        /\ LastTerm(i) = currentTerm[i]
        /\ currentTerm[s] = currentTerm[i]
        /\ Len(log[s]) >= Len(log[i])
        /\ log[s][Len(log[s])] = log[i][Len(log[i])]
    /\ committed' = committed \cup {[entry |-> <<Len(log[i]), log[i][Len(log[i])]>>, term |-> currentTerm[i]]}
    /\ UNCHANGED <<currentTerm,leader,log>>

\* i sends entries to 'j'
GetEntries(i, j) == 
    /\ Len(log[i]) > 0 
    \* Node 'i' has a newer log.
    /\ logLTE(<<Len(log[j]),LastTerm(j)>>, <<Len(log[i]),LastTerm(i)>>)
    \* Send the entire log.
    /\ log' = [log EXCEPT ![j] = log[i]]
    /\ UNCHANGED <<currentTerm,leader,committed>>

Init == 
    /\ leader = [i \in Server |-> FALSE]
    /\ currentTerm = [i \in Server |-> 0]
    /\ log = [i \in Server |-> <<>>]
    /\ committed = {}

Next ==
    \/ \E i \in Server, Q \in Quorums : BecomeLeader(i, Q, currentTerm[i] + 1)
    \/ \E i \in Server : ClientRequest(i)
    \/ \E i \in Server, Q \in Quorums : CommitEntry(i, Q)
    \/ \E i,j \in Server : GetEntries(i, j)

CONSTANT MaxTerm
CONSTANT MaxLogLen
Constraint == 
    /\ \A s \in Server : currentTerm[s] <= MaxTerm
    /\ \A s \in Server : Len(log[s]) <= MaxLogLen


InLog(e, i) == \E x \in DOMAIN log[i] : x = e[1] /\ log[i][x] = e[2]

Inv == ~(\E s,t \in Server : leader[s] /\ leader[t] /\ s#t /\ Len(log[s]) > 1 /\ committed # {})
\* Inv == committed = {}

ElectionSafety == \A s,t \in Server : (leader[s] /\ leader[t] /\ s # t) => (currentTerm[s] # currentTerm[t])

LeaderCompleteness == \A s \in Server : leader[s] => \A c \in committed : c.term < currentTerm[s] => InLog(c.entry, s) 

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
    \A Q \in Quorums :
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