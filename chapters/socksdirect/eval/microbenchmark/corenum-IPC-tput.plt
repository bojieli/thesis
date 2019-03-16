set terminal pdf
set output "corenum-IPC-tput.pdf"

set lmargin 12
set rmargin 3.4
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5 ps 1.0
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5 ps 1.0
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5 ps 1.0
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5 ps 1.0
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5 ps 1.0
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5 ps 1.0
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5 ps 1.0
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5 ps 1.0
set xlabel "Number of cores"  font "Arial, 24"
set ylabel "Throughput (M op/s)" font "Arial, 24" offset graph -0.04, 0
set xtics font "Arial, 24"
set ytics font "Arial, 24"
set key inside reverse left top font "Arial, 24"

$linux << EOD
1 1182
2 2720
3 3718
4 4825
5 5844
6 5182
7 8504
8 8501
9 9125
10 7928
11 8165
12 7906
13 8268
14 8773
15 7414
16 7587
EOD

$libvma << EOD
1 1153
2 3310
3 3782
4 5401
5 5880
6 7100
7 8316
8 7537
9 8178
10 8256
11 7982
12 10809
13 8194
14 8807
15 7929
16 8141
EOD

$libsd << EOD
1 23707
2 45413
3 63126
4 79044
5 100975
6 121785
7 140448
8 160251
9 184827
10 203907
11 221930
12 241078
13 261136
14 278419
15 300805
16 306616
EOD

$rsocket << EOD
1 5788
2 4474
3 6154
4 6047
5 11950
6 13642
7 13892
8 15543
9 17138
10 20619
11 18634
12 19719
13 22456
14 24528
15 24583
16 24462
EOD

plot "$libsd" using ($1):($2/1000) title "SocksDirect" with linespoints linestyle 1,\
"$linux" using ($1):($2/1000) title "Linux" with linespoints linestyle 2,\
"$libvma" using ($1):($2/1000) title "LibVMA" with linespoints linestyle 3,\
"$rsocket" using ($1):($2/1000) title "RSocket" with linespoints linestyle 4
