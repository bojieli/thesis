set terminal pdf
set output "sharecore-lat.pdf"

set lmargin 15
set rmargin 3.4
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5 ps 1.0
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5 ps 1.0
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5 ps 1.0
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5 ps 1.0
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5 ps 1.0
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5 ps 1.0
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5 ps 1.0
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5 ps 1.0
set xlabel "Number of processes sharing a core"  font "Arial, 24"
set ylabel "Latency ({/Symbol m}s, log scale)" font "Arial, 24" offset graph -0.05, 0
set xtics font "Arial, 24"
set ytics font "Arial, 24"
set logscale y 10
set key outside horizontal font "Arial, 20"

$linux << EOD
1	11	10	13
2	17	13	24
3	22	13	29
4	27	14	39
5	31	16	53
6	34	16	60
7	40	18	74
8	45	20	79
EOD

$libsd << EOD
1	0.30	0.23	0.4
2	0.82	0.30	1.4
3	1.08	0.32	1.96
4	1.34	0.34	2.48
5	1.60	0.34	2.90
6	1.86	0.35	3.42
7	2.12	0.37	3.85
8	2.40	0.45	4.38
EOD


plot "$libsd" title "SocksDirect" with yerrorlines linestyle 1,\
"$linux" title "Linux" with yerrorlines linestyle 2
