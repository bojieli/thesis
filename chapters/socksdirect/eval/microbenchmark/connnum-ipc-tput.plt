set terminal pdf
set output "connnum-ipc-tput.pdf"

set lmargin 12
set rmargin 5
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5 ps 1.0
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5 ps 1.0
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5 ps 1.0
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5 ps 1.0
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5 ps 1.0
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5 ps 1.0
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5 ps 1.0
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5 ps 1.0
set xlabel "Number of connections"  font "Arial, 24"
set ylabel "Throughput (M op/s)" font "Arial, 24" offset graph -0.02, 0
set xtics ("1" 1, "10" 10, "100" 100, "1K" 1000, "10K" 10000, "100K" 100000, "1M" 1000000, "10M" 10000000, "100M" 100000000) font "Arial, 24"
set ytics font "Arial, 24"
set key inside right center font "Arial, 24"
set logscale x 10

$linux << EOD
1 1368
10 1367
100 1759
1000 1537
10000 419
50000 307 
EOD

$libvma << EOD
1 18845
10 17110
100 11624
1000 7560
10000 5216
EOD

$libsd << EOD
1 23267
10 23269
100 23463
1000 23421
10000 23272
100000 22113
1000000 22895 
10000000 23107
100000000 23140
EOD

plot "$libsd" using ($1):($2/1000) title "SocksDirect" with linespoints linestyle 1,\
"$linux" using ($1):($2/1000) title "Linux" with linespoints linestyle 2,\
"$libvma" using ($1):($2/1000) title "LibVMA" with linespoints linestyle 3
