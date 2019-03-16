set terminal pdf
set output "corenum-http-tput.pdf"

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
set ylabel "Throughput (K req/s)" font "Arial, 24" offset graph -0.04, 0
set xtics font "Arial, 24"
set ytics font "Arial, 24"
set key inside reverse left top font "Arial, 24"

$linux << EOD
1 17.65
2 33.39
3 48.97
4 61.04
5 69.48
6 84.17
7 98.46
8 112.37
9 126.79
10 139.51
11 152.01
12 156.44
13 166.44
14 173.34
15 182.10
16 196.02
EOD

$libsd << EOD
1 61.94
2 122.9
3 178.2
4 235.7
5 287.9
6 337.8
7 388.4
8 432.6
9 483.6
10 532.7
11 572.7
12 611.5
13 649.4
14 708.1
15 743.6
16 785.1
EOD

plot $libsd using ($1):($2) title "SocksDirect" with linespoints linestyle 1,\
"$linux" using ($1):($2) title "Linux socket" with linespoints linestyle 2
