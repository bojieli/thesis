set terminal pdf
set output "nfv-tun-tput.pdf"
set lmargin 13
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5  ps 1.0
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5  ps 1.0
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5  ps 1.0
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5 ps 1.0
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5 ps 1.0
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5 ps 1.0
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5 ps 1.0
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5 ps 1.0
set xlabel "Number of cores"  font "Arial, 24"
set ylabel "Tput (M packet/s)" font "Arial, 24" offset graph -0.03, 0
set ytics font "Arial, 24"
set key outside horizontal font "Arial, 20"

$netbricks << EOD
1 22
2 22
3 26
4 28
5 26
6 25
7 22.5
8 20
EOD


$linuxpipe << EOD
1 1.5
2 1.6
3 1.5
4 1.5
5 1.4
6 1.3
7 1.2
8 1.2
EOD


$linuxsocket << EOD
1 1.2
2 1.2
3 1.2
4 1.1
5 1
6 1
7 1
8 0.9
EOD


$libsd << EOD
1 23.7
2 22.7
3 21.9
4 19.8
5 20.1
6 20.0
7 19.9
8 19.2
EOD


plot "$libsd" title "SocksDirect" with linespoints linestyle 1,\
"$linuxpipe" title "Linux Pipe" with linespoints linestyle 2, \
"$linuxsocket" title "Linux Socket" with linespoints linestyle 3, \
"$netbricks" title "NetBricks" with linespoints linestyle 4
