set terminal pdf dashed monochrome
set output "fork-tput.pdf"
set title "Throuput of SocksDirect with fork happening"
set xlabel "Time"
set ylabel "Throughput/k connections per sec"
set xtics ('T_0' 2, 'T_1' 4, 'T_2' 6, 'T_3' 8)
set ytics 0,1
set y2tics 100
set y2label "Latency/ns"
set xrange [0:10]
set y2range [0:1000]
set yrange [0:2]
set arrow from 2, graph 0 to 2, graph 1 nohead linetype 2
set arrow from 4, graph 0 to 4, graph 1 nohead linetype 2
set arrow from 6, graph 0 to 6, graph 1 nohead linetype 2
set arrow from 8, graph 0 to 8, graph 1 nohead linetype 2

plot 1 title "Throughput", 400 axes x1y2 title "Latency"