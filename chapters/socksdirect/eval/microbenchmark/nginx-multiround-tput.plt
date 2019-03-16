set terminal pdf
set output "nginx-multiround-tput.pdf"


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
set xlabel "Round-trips to key-value store"  font "Arial, 24"
set ylabel "Latency (ms, log-scale)" font "Arial, 24" offset graph -0.05, 0
set xtics  ("1" 1, "10" 10, "100" 100, "1K" 1000, "10K" 10000, "100K" 100000, "1M" 1000000) font "Arial, 24"
set ytics ("0.1" 0.1, "1" 1, "10" 10, "100" 100, "1K" 1000, "10K" 10000, "100K" 100000) font "Arial, 24"
set key inside reverse left top font "Arial, 24"
set logscale y 10 
set logscale x 10
set samples 7
set xrange [1:1000000]
set grid ytics

$linux << EOD
1 14
10 15
100 17
1000 43
2000 67
5000 145
10000 235
20000 454
50000 1101
100000 1968
200000 4135
500000 10112
1000000 19299
EOD

$libsd << EOD
1 14
10 14
100 15
1000 19
2000 24
5000 32
10000 48
20000 96
50000 146
100000 245
200000 455
500000 1681
1000000 2868
EOD

plot $libsd title "SocksDirect" with linespoints linestyle 1,\
$linux title "Linux socket" with linespoints linestyle 2
