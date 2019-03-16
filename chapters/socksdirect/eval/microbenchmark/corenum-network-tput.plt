set terminal pdf
set output "corenum-network-tput.pdf"

set lmargin 12
set rmargin 3.4
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5 ps 1.0
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5 ps 1.0
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5 ps 1.0
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5 ps 1.0 dt 2
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
1 1272
2 2457
3 3772
4 4956
5 6226
6 7341
7 8000
8 8282
9 8570
10 7323
11 9002
12 7506
13 7560
14 8199
15 8005
16 8151
EOD

$libvma << EOD
1 18732.7 18578.0 18777.0
2 4732.0 4578.0 4910.0
3 1884.1 1511.0 10495.0
4 1116.2 605.0 4323.0
5 2002.4 766.0 7122.0
6 4505.3 680.0 7501.0
7 2533.0 607.0 6136.0
8 2868.1 1901.0 4695.0
9 3866.8 2855.0 5715.0
10 3506.6 2789.0 4511.0
11 2789.4 2052.0 3759.0
12 2464.3 1823.0 3487.0
13 1926.3 1302.0 3009.0
14 2297.1 1719.0 3084.0
15 2388.3 1701.0 2910.0
16 2519.6 1914.0 3297.0
EOD

$RDMA << EOD
1	13406.31360
2	26817.17265
3	39520.31865
4	51659.95182
5	63393.07340
6	75603.97482
7	88146.26680
8	99901.55355
9	102408.10508
10	102067.94124
11	102348.45893
12	102348.45893
13	102348.45893
14	102348.45893
15	102348.45893
16	102348.45893
EOD

$libsd << EOD
1 19265.9
2 37847.1
3 58249.8
4 76811.9
5 95356.6
6 113754
7 132000
8 150045
9 168382
10 185935
11 203481
12 220289
13 236257
14 251339
15 266186
16 276226
EOD

$rsocket << EOD
1 5621
2 5509
3 10731
4 11469
5 16435
6 18751
7 16250
8 17580
9 18204
10 24063
11 21281
12 25759
13 25301
14 28158
15 37027
16 33370
EOD

plot $libsd using ($1):($2/1000) title "SocksDirect" with linespoints linestyle 1,\
"$linux" using ($1):($2/1000) title "Linux" with linespoints linestyle 2,\
"$libvma" using ($1):($2/1000) title "LibVMA" with yerrorlines linestyle 3,\
"$rsocket" using ($1):($2/1000) title "RSocket" with linespoints linestyle 5,\
"$RDMA" using ($1):($2/1000) title "RDMA" with linespoints linestyle 4
