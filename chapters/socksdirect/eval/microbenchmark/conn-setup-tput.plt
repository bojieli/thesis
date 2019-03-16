set terminal pdf
set output "conn-setup-tput.pdf"
set lmargin 12
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5 ps 1.0
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5 ps 1.0
set style line 3 pt 6 lc rgb "#4daf4a"linewidth 1.5 ps 1.0
set style line 4 pt 12 lc rgb "#984ea3"linewidth 1.5 ps 1.0
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5 ps 1.0
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5 ps 1.0
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5 ps 1.0 dt 2
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5 ps 1.0
set xlabel "Number of Cores"  font "Arial, 24"
set ylabel "Tput (M connection/s)" font "Arial, 24" offset graph -0.02, 0
set xtics font "Arial, 24"
set ytics font "Arial, 24"
#set key inside right center font "Arial, 24"
set key outside horizontal font "Arial, 20"


$linux << EOD
1 68
2 106
3 153
4 199
5 241
6 273
7 294
8 340
EOD

$libvma << EOD
1 26
2 46
3 69
4 85
5 100
6 128
7 142
8 163
EOD

$libsd << EOD
1 1424
2 2751
3 4047
4 4924
5 5235
6 5286
7 5245
8 5302
EOD

$mtcp <<EOD
1 750
2 1250
4 2200
6 2350
8 2900
EOD

plot "$libsd" using ($1):($2/1000) title "SocksDirect" with linespoints linestyle 1, \
"$linux" using ($1):($2/1000) title "Linux" with linespoints linestyle 2, \
"$libvma" using ($1):($2/1000) title "LibVMA" with linespoints linestyle 3, \
"$mtcp" using ($1):($2/1000) title "mTCP" with linespoints linestyle 7
