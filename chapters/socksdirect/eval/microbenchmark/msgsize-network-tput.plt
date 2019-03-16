set terminal pdf
set output "msgsize-network-tput.pdf"
set lmargin 12
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5 ps 1.0
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5 ps 1.0
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5 ps 1.0
set style line 4 pt 12 lc rgb "#984ea3" linewidth 2 dt 2 ps 1.0
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5 ps 1.0
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5 ps 1.0
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5 ps 1.0
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5 ps 1.0
set xlabel "Message size (Bytes)"  font "Arial, 24"
set ylabel "Throughput (Gbps)" font "Arial, 24" offset graph -0.02, 0
set yrange [0.1:100]
set logscale y 10
set xtics ("8B" 8, "64B" 64, "512B" 512, "4K" 4096, "32K" 32768, "256K" 262144, "1M" 1048576) font "Arial, 24"
set ytics font "Arial, 24"
set key inside reverse right bottom vertical font "Arial, 20"
set logscale x 2

$linux << EOD
8	0.077453613
16	0.150268555
32	0.289550781
64	0.5546875
128	1.006835938
256	1.861328125
512	3.53125
1024	6.4609375
2048	11.640625
4096	17.34375
8192	22.75
16384	23.875
32768	23.75
65536	27.5
131072	31
262144	28
524288	24
1048576	32
EOD

$libvma << EO
8	1.138977051
16	2.210327148
32	4.320556641
64	7.547851563
128	12.31738281
256	16.87890625
512	21.61328125
1024	25.59375
2048	28.34375
4096	27.03125
8192	30.75
16384	27.75
32768	28.25
65536	25
131072	30
262144	30
524288	28
1048576	32
EOD

$RDMA << EOD
8	0.815498146
16	1.635326577
32	3.25909042
64	6.520168945
128	13.02890251
256	26.00604424
512	51.636025
1024 59.4323
4096 87.4905
2048 82.9869
8192 87.7136
16384 87.4900
32768 87.7817
65536 88.0943
131072	88.1126
262144	87.3129
524288	87.9916
1048576 88.2070
EOD

$libsd << EOD
8 1.18912
16 1.60896
32 2.73408
64 4.89984
128 8.93952
256 20.6029
512 37.6422
1024 38.0928
2048 39.8131
4096 38.8301
8192 38.5024
16384	72.1025
32768	80.2689
65536	84.3200
131072	85.9104
262144	86.2243
524288	87.0174
1048576	87.2619
EOD

$rsocket << EOD
8 0.361984
16 0.71616
32 1.40774
64 2.8288
128 5.60947
256 10.6271
512 18.5549
1024 26.796
2048 24.3958
4096 24.576
8192 28.3771
16384 29.4912
32768 32.5059
65536 36.1759
131072 20.9715
262144 29.3601
524288 25.1658
1048576 25.1658
EOD

plot "$libsd" title "SocksDirect" with linespoints linestyle 1,\
"$linux" title "Linux" with linespoints linestyle 2, \
"$libvma" title "LibVMA" with linespoints linestyle 3, \
"$rsocket" title "RSocket" with linespoints linestyle 5, \
"$RDMA" title "RDMA" with linespoints linestyle 4
