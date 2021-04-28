; benchmark generated from python API
(set-info :status unknown)
(declare-sort term 0)
 (declare-sort quorum 0)
 (declare-sort index 0)
 (declare-sort server 0)
 (declare-fun indlt (index index) Bool)
(declare-fun indzero () index)
(declare-fun lte (term term) Bool)
(declare-fun succ (index index) Bool)
(declare-fun termzero () term)
(declare-fun member (server quorum) Bool)
(declare-fun indlte (index index) Bool)
(declare-fun en_noop () Bool)
(declare-fun |en_ext:commitEntry| () Bool)
(declare-fun |en_ext:becomeLeader| () Bool)
(declare-fun |en_ext:clientRequest| () Bool)
(declare-fun leader (server) Bool)
(declare-fun __leader (server) Bool)
(declare-fun committed (index term) Bool)
(declare-fun __committed (index term) Bool)
(declare-fun loglen (server) index)
(declare-fun __loglen (server) index)
(declare-fun currentTerm (server) term)
(declare-fun __currentTerm (server) term)
(declare-fun log (server index) term)
(declare-fun __log (server index) term)
(declare-fun V__fml () server)
(declare-fun |V__fml:q| () quorum)
(declare-fun |V__fml:newterm| () term)
(declare-fun |V__fml:nextInd| () index)
(assert
 (let (($x5118 (forall ((X32 index) )(let (($x2095 (indlt indzero X32)))
 (or (= X32 indzero) $x2095)))
 ))
 (let (($x4517 (forall ((Y27 index) (Z28 index) (X26 index) )(let (($x948 (indlt X26 Z28)))
 (let (($x1998 (indlt Y27 Z28)))
 (let (($x14793 (indlt X26 Y27)))
 (let (($x14795 (and $x14793 $x1998)))
 (=> $x14795 $x948))))))
 ))
 (let (($x14778 (forall ((X30 index) (Y31 index) )(let (($x948 (indlt Y31 X30)))
 (let (($x1166 (= X30 Y31)))
 (let (($x1423 (indlt X30 Y31)))
 (or $x1423 $x1166 $x948)))))
 ))
 (let (($x5157 (forall ((X23 term) (Y term) (Z term) )(let (($x1963 (lte X23 Z)))
 (let (($x13546 (lte Y Z)))
 (let (($x13501 (not $x13546)))
 (let (($x14499 (not (lte X23 Y))))
 (or $x14499 $x13501 $x1963))))))
 ))
 (let (($x2006 (forall ((X33 index) (Y34 index) (Z35 index) )(let (($x2056 (indlt X33 Z35)))
 (let (($x1870 (and $x2056 (not (and (indlt X33 Y34) (indlt Y34 Z35))))))
 (let (($x5115 (succ X33 Z35)))
 (=> $x5115 $x1870)))))
 ))
 (let (($x5223 (forall ((X22 term) )(lte X22 X22))
 ))
 (let (($x4413 (forall ((X21 term) )(lte termzero X21))
 ))
 (let (($x14536 (forall ((Q1 quorum) (Q2 quorum) )(exists ((N server) )(let (($x9604 (member N Q2)))
 (let (($x1891 (member N Q1)))
 (and $x1891 $x9604))))
 )
 ))
 (let (($x2094 (forall ((A index) (B index) )(let (($x1166 (= A B)))
 (let (($x1423 (indlt A B)))
 (let (($x2168 (indlte A B)))
 (let (($x2177 (= $x2168 $x1423)))
 (or $x2177 $x1166))))))
 ))
 (let (($x1165 (forall ((Y term) (X25 term) )(let (($x13546 (lte Y X25)))
 (let (($x1235 (lte X25 Y)))
 (or $x1235 $x13546))))
 ))
 (let (($x1462 (forall ((X29 index) )(let (($x1996 (indlt X29 X29)))
 (not $x1996)))
 ))
 (let (($x13566 (forall ((Y term) (X24 term) )(let (($x13546 (lte Y X24)))
 (let (($x13501 (not $x13546)))
 (or (not (lte X24 Y)) $x13501 (= X24 Y)))))
 ))
 (let (($x62287 (and $x13566 $x1462 $x1165 $x2094 $x14536 $x4413 $x5223 $x2006 $x5157 $x14778 $x4517 $x5118)))
 (let (($x688 (not en_noop)))
 (let (($x586 (not |en_ext:commitEntry|)))
 (let (($x585 (or $x586 $x688)))
 (let (($x796 (not |en_ext:becomeLeader|)))
 (let (($x822 (or $x796 $x688)))
 (let (($x816 (or $x796 $x586)))
 (let (($x825 (not |en_ext:clientRequest|)))
 (let (($x826 (or $x825 $x688)))
 (let (($x827 (or $x825 $x586)))
 (let (($x811 (or $x825 $x796)))
 (let (($x835 (or |en_ext:clientRequest| |en_ext:becomeLeader| |en_ext:commitEntry| en_noop)))
 (let (($x918 (forall ((|1:server| server) )(let (($x936 (leader |1:server|)))
 (let (($x814 (__leader |1:server|)))
 (= $x814 $x936))))
 ))
 (let (($x881 (forall ((|1:index| index) (|2:term| term) )(let (($x4655 (committed |1:index| |2:term|)))
 (let (($x4907 (__committed |1:index| |2:term|)))
 (= $x4907 $x4655))))
 ))
 (let (($x1924 (forall ((|1:server| server) )(let ((?x2033 (loglen |1:server|)))
 (let ((?x2058 (__loglen |1:server|)))
 (= ?x2058 ?x2033))))
 ))
 (let (($x905 (forall ((|1:server| server) )(let ((?x902 (currentTerm |1:server|)))
 (let ((?x903 (__currentTerm |1:server|)))
 (= ?x903 ?x902))))
 ))
 (let (($x4641 (forall ((|1:server| server) (|2:index| index) )(let ((?x860 (log |1:server| |2:index|)))
 (let ((?x934 (__log |1:server| |2:index|)))
 (= ?x934 ?x860))))
 ))
 (let (($x800 (and $x4641 $x905 $x1924 $x881 $x918)))
 (let (($x4431 (=> en_noop $x800)))
 (let (($x801 (forall ((X server) )(let ((?x870 (__loglen V__fml)))
 (let ((?x4998 (__log V__fml ?x870)))
 (let ((?x872 (__log X ?x870)))
 (let (($x4562 (= ?x872 ?x4998)))
 (let ((?x2058 (__loglen X)))
 (let (($x14666 (indlte ?x2058 ?x870)))
 (let (($x939 (and $x14666 $x4562)))
 (let (($x1467 (member X |V__fml:q|)))
 (=> $x1467 $x939))))))))))
 ))
 (let (($x843 (forall ((X server) )(let ((?x923 (__currentTerm V__fml)))
 (let ((?x903 (__currentTerm X)))
 (let (($x824 (= ?x903 ?x923)))
 (let (($x1467 (member X |V__fml:q|)))
 (=> $x1467 $x824))))))
 ))
 (let (($x4515 (member V__fml |V__fml:q|)))
 (let ((?x870 (__loglen V__fml)))
 (let (($x1488 (= ?x870 indzero)))
 (let (($x1872 (not $x1488)))
 (let (($x4643 (__leader V__fml)))
 (let (($x14545 (forall ((V038 index) (V139 term) )(let (($x4907 (__committed V038 V139)))
 (let ((?x870 (__loglen V__fml)))
 (let ((?x4998 (__log V__fml ?x870)))
 (let (($x1983 (= V139 ?x4998)))
 (let (($x807 (= V038 ?x870)))
 (let (($x4750 (and $x807 $x1983)))
 (let (($x1543 (or $x4750 $x4907)))
 (let (($x4655 (committed V038 V139)))
 (= $x4655 (and (or (not $x4750) true) $x1543)))))))))))
 ))
 (let (($x9648 (and $x14545 $x4643 $x1872 $x4515 $x843 $x801)))
 (let (($x4744 (and $x9648 $x4641 $x905 $x1924 $x918)))
 (let (($x14761 (=> |en_ext:commitEntry| $x4744)))
 (let (($x12688 (forall ((X server) )(let ((?x870 (__loglen V__fml)))
 (let ((?x4998 (__log V__fml ?x870)))
 (let ((?x2058 (__loglen X)))
 (let ((?x14768 (__log X ?x2058)))
 (let (($x13573 (= ?x14768 ?x4998)))
 (let (($x890 (lte ?x14768 ?x4998)))
 (let (($x2923 (and $x890 (not $x13573))))
 (let (($x14541 (indlt ?x870 ?x2058)))
 (let (($x14164 (= ?x4998 ?x14768)))
 (let (($x2020 (and $x14164 $x14541)))
 (let (($x1566 (= ?x2058 indzero)))
 (let (($x1467 (member X |V__fml:q|)))
 (=> $x1467 (or $x1566 $x2020 $x2923)))))))))))))))
 ))
 (let (($x607 (forall ((X server) )(let ((?x903 (__currentTerm X)))
 (let (($x590 (lte ?x903 |V__fml:newterm|)))
 (let (($x784 (and $x590 (not (= ?x903 |V__fml:newterm|)))))
 (let (($x1467 (member X |V__fml:q|)))
 (=> $x1467 $x784))))))
 ))
 (let ((?x923 (__currentTerm V__fml)))
 (let (($x2141 (= |V__fml:newterm| ?x923)))
 (let (($x2140 (not $x2141)))
 (let (($x2082 (lte ?x923 |V__fml:newterm|)))
 (let (($x1422 (= |V__fml:newterm| termzero)))
 (let (($x5090 (not $x1422)))
 (let (($x14745 (forall ((V0 server) )(let (($x1514 (and (or (not (member V0 |V__fml:q|)) false) (or (member V0 |V__fml:q|) (__leader V0)))))
 (let (($x2002 (= V0 V__fml)))
 (let (($x936 (leader V0)))
 (= $x936 (and (or (not $x2002) true) (or $x2002 $x1514)))))))
 ))
 (let (($x14741 (forall ((V0 server) )(let ((?x903 (__currentTerm V0)))
 (let (($x1467 (member V0 |V__fml:q|)))
 (let ((?x14720 (ite $x1467 |V__fml:newterm| ?x903)))
 (let ((?x902 (currentTerm V0)))
 (= ?x902 ?x14720))))))
 ))
 (let (($x1376 (and $x14741 $x14745 $x5090 $x2082 $x2140 $x4515 $x607 $x12688)))
 (let (($x1270 (and $x1376 $x4641 $x1924 $x881)))
 (let (($x1887 (=> |en_ext:becomeLeader| $x1270)))
 (let (($x1962 (succ ?x870 |V__fml:nextInd|)))
 (let (($x2066 (forall ((V0 server) )(let ((?x2058 (__loglen V0)))
 (let (($x2002 (= V0 V__fml)))
 (let ((?x4980 (ite $x2002 |V__fml:nextInd| ?x2058)))
 (let ((?x2033 (loglen V0)))
 (= ?x2033 ?x4980))))))
 ))
 (let (($x5064 (forall ((V0 server) (V1 index) )(let ((?x934 (__log V0 V1)))
 (let ((?x923 (__currentTerm V__fml)))
 (let ((?x860 (log V0 V1)))
 (= ?x860 (ite (and (= V0 V__fml) (= V1 |V__fml:nextInd|)) ?x923 ?x934))))))
 ))
 (let (($x5129 (and $x5064 $x2066 $x4643 $x1962)))
 (let (($x5102 (and $x5129 $x905 $x881 $x918)))
 (let (($x5095 (=> |en_ext:clientRequest| $x5102)))
 (let (($x2125 (and $x5095 $x1887 $x14761 $x4431 $x835 $x811 $x827 $x826 $x816 $x822 $x585)))
 (let (($x25507 (exists ((|Q:index:i:0| index) )(committed |Q:index:i:0| termzero))
 ))
 (let (($x4007094 (not $x25507)))
 (let (($x1190425 (exists ((|Q:server:i:0| server) )(not (= (log |Q:server:i:0| indzero) termzero)))
 ))
 (let (($x3752557 (not $x1190425)))
 (let (($x26305 (exists ((|Q:server:i:0| server) )(let (($x936 (leader |Q:server:i:0|)))
 (and $x936 (= (currentTerm |Q:server:i:0|) termzero))))
 ))
 (let (($x3955170 (not $x26305)))
 (let (($x1248898 (exists ((|Q:index:i:1| index) (|Q:server:i:0| server) )(let (($x25544 (not (= (log |Q:server:i:0| (loglen |Q:server:i:0|)) (currentTerm |Q:server:i:0|)))))
 (and $x25544 (= (log |Q:server:i:0| |Q:index:i:1|) (currentTerm |Q:server:i:0|)))))
 ))
 (let (($x4132474 (not $x1248898)))
 (let (($x341385 (forall ((|Q:quorum:i:0| quorum) )(exists ((|Q:term:i:0| term) (|Q:term:i:1| term) (|Q:server:i:1| server) (|Q:server:i:0| server) )(let (($x27711 (not (lte |Q:term:i:1| |Q:term:i:0|))))
 (let (($x15647 (member |Q:server:i:0| |Q:quorum:i:0|)))
 (let ((?x320034 (currentTerm |Q:server:i:1|)))
 (let (($x348848 (= ?x320034 |Q:term:i:1|)))
 (let ((?x902 (currentTerm |Q:server:i:0|)))
 (let (($x305949 (= ?x902 |Q:term:i:0|)))
 (and $x305949 $x348848 $x15647 $x27711))))))))
 )
 ))
 (let (($x2976727 (not $x341385)))
 (let (($x3981279 (forall ((|Q:quorum:i:0| quorum) )(exists ((|Q:index:i:0| index) (|Q:term:i:0| term) (|Q:term:i:1| term) (|Q:index:i:1| index) (|Q:server:i:0| server) )(let (($x1741538 (not (= |Q:term:i:0| |Q:term:i:1|))))
 (let (($x3629491 (member |Q:server:i:0| |Q:quorum:i:0|)))
 (let (($x3972036 (committed |Q:index:i:1| |Q:term:i:0|)))
 (let ((?x2033 (loglen |Q:server:i:0|)))
 (let (($x4132457 (= ?x2033 |Q:index:i:0|)))
 (let ((?x1032505 (log |Q:server:i:0| |Q:index:i:0|)))
 (let (($x3716060 (= ?x1032505 |Q:term:i:1|)))
 (and $x3716060 $x4132457 $x3972036 $x3629491 $x1741538)))))))))
 )
 ))
 (let (($x2635377 (not $x3981279)))
 (let (($x1288276 (exists ((|Q:index:i:0| index) (|Q:server:i:0| server) )(let (($x1038416 (not (= termzero (log |Q:server:i:0| |Q:index:i:0|)))))
 (and $x1038416 (not (leader |Q:server:i:0|)))))
 ))
 (let (($x3754099 (not $x1288276)))
 (let (($x1171090 (exists ((|Q:index:i:0| index) (|Q:server:i:0| server) )(let (($x1038416 (not (= termzero (log |Q:server:i:0| |Q:index:i:0|)))))
 (and $x1038416 (not (= (currentTerm |Q:server:i:0|) (log |Q:server:i:0| |Q:index:i:0|))) (not (= termzero (currentTerm |Q:server:i:0|))))))
 ))
 (let (($x3752759 (not $x1171090)))
 (let (($x19097 (exists ((|Q:server:i:0| server) )(let (($x936 (leader |Q:server:i:0|)))
 (let (($x25544 (not (= (log |Q:server:i:0| (loglen |Q:server:i:0|)) (currentTerm |Q:server:i:0|)))))
 (and $x25544 $x936 (not (= indzero (loglen |Q:server:i:0|)))))))
 ))
 (let (($x2470425 (not $x19097)))
 (let (($x2081560 (forall ((I index) (T term) (X server) )(let (($x2104596 (= (log X I) T)))
 (let (($x936 (leader X)))
 (let (($x1261536 (committed I T)))
 (let (($x2104586 (and $x1261536 $x936 (and (lte T (currentTerm X)) (not (= T (currentTerm X)))))))
 (=> $x2104586 $x2104596))))))
 ))
 (let (($x2082955 (and $x2081560 $x2470425 $x3752759 $x3754099 $x2635377 $x2976727 $x4132474 $x3955170 $x3752557 $x4007094)))
 (let (($x1837956 (not $x2082955)))
 (let (($x21527 (exists ((|Q:index:i:0| index) )(__committed |Q:index:i:0| termzero))
 ))
 (let (($x3849591 (not $x21527)))
 (let (($x1292885 (exists ((|Q:server:i:0| server) )(not (= (__log |Q:server:i:0| indzero) termzero)))
 ))
 (let (($x2055821 (not $x1292885)))
 (let (($x24929 (exists ((|Q:server:i:0| server) )(let ((?x903 (__currentTerm |Q:server:i:0|)))
 (let (($x25177 (= ?x903 termzero)))
 (let (($x814 (__leader |Q:server:i:0|)))
 (and $x814 $x25177)))))
 ))
 (let (($x1762642 (not $x24929)))
 (let (($x1224576 (exists ((|Q:index:i:1| index) (|Q:server:i:0| server) )(let (($x25023 (not (= (__log |Q:server:i:0| (__loglen |Q:server:i:0|)) (__currentTerm |Q:server:i:0|)))))
 (and $x25023 (= (__log |Q:server:i:0| |Q:index:i:1|) (__currentTerm |Q:server:i:0|)))))
 ))
 (let (($x1764430 (not $x1224576)))
 (let (($x12072 (forall ((|Q:quorum:i:0| quorum) )(exists ((|Q:term:i:0| term) (|Q:term:i:1| term) (|Q:server:i:1| server) (|Q:server:i:0| server) )(let (($x27711 (not (lte |Q:term:i:1| |Q:term:i:0|))))
 (let (($x15647 (member |Q:server:i:0| |Q:quorum:i:0|)))
 (let ((?x6502 (__currentTerm |Q:server:i:1|)))
 (let (($x6431 (= ?x6502 |Q:term:i:1|)))
 (let ((?x903 (__currentTerm |Q:server:i:0|)))
 (let (($x1059 (= ?x903 |Q:term:i:0|)))
 (and $x1059 $x6431 $x15647 $x27711))))))))
 )
 ))
 (let (($x3253239 (not $x12072)))
 (let (($x2348852 (forall ((|Q:quorum:i:0| quorum) )(exists ((|Q:index:i:0| index) (|Q:term:i:0| term) (|Q:term:i:1| term) (|Q:index:i:1| index) (|Q:server:i:0| server) )(let (($x1741538 (not (= |Q:term:i:0| |Q:term:i:1|))))
 (let (($x3629491 (member |Q:server:i:0| |Q:quorum:i:0|)))
 (let (($x1952460 (__committed |Q:index:i:1| |Q:term:i:0|)))
 (let ((?x2058 (__loglen |Q:server:i:0|)))
 (let (($x1941925 (= ?x2058 |Q:index:i:0|)))
 (let ((?x1269042 (__log |Q:server:i:0| |Q:index:i:0|)))
 (let (($x1955800 (= ?x1269042 |Q:term:i:1|)))
 (and $x1955800 $x1941925 $x1952460 $x3629491 $x1741538)))))))))
 )
 ))
 (let (($x2133173 (not $x2348852)))
 (let (($x1201131 (exists ((|Q:index:i:0| index) (|Q:server:i:0| server) )(let (($x814 (__leader |Q:server:i:0|)))
 (let (($x25104 (not $x814)))
 (let (($x1304218 (not (= termzero (__log |Q:server:i:0| |Q:index:i:0|)))))
 (and $x1304218 $x25104)))))
 ))
 (let (($x1736187 (not $x1201131)))
 (let (($x1198682 (exists ((|Q:index:i:0| index) (|Q:server:i:0| server) )(let (($x1304218 (not (= termzero (__log |Q:server:i:0| |Q:index:i:0|)))))
 (and $x1304218 (not (= (__currentTerm |Q:server:i:0|) (__log |Q:server:i:0| |Q:index:i:0|))) (not (= termzero (__currentTerm |Q:server:i:0|))))))
 ))
 (let (($x2753517 (not $x1198682)))
 (let (($x24674 (exists ((|Q:server:i:0| server) )(let (($x814 (__leader |Q:server:i:0|)))
 (let (($x25023 (not (= (__log |Q:server:i:0| (__loglen |Q:server:i:0|)) (__currentTerm |Q:server:i:0|)))))
 (and $x25023 $x814 (not (= indzero (__loglen |Q:server:i:0|)))))))
 ))
 (let (($x3635796 (not $x24674)))
 (let (($x2975943 (forall ((I index) (T term) (X server) )(let (($x2035802 (= (__log X I) T)))
 (let (($x3580170 (not (= T (__currentTerm X)))))
 (let ((?x903 (__currentTerm X)))
 (let (($x1736501 (lte T ?x903)))
 (let (($x814 (__leader X)))
 (let (($x337132 (__committed I T)))
 (=> (and $x337132 $x814 (and $x1736501 $x3580170)) $x2035802))))))))
 ))
 (let (($x3689454 (and $x2975943 $x3635796 $x2753517 $x1736187 $x2133173 $x3253239 $x1764430 $x1762642 $x2055821 $x3849591)))
 (and $x3689454 $x1837956 $x2125 $x62287)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
