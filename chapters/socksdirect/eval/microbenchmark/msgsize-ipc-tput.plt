set terminal pdf
set output "msgsize-ipc-tput.pdf"
set lmargin 13
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5  ps 1.0
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5  ps 1.0
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5  ps 1.0
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5 ps 1.0
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5 ps 1.0
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5 ps 1.0
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5 ps 1.0
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5 ps 1.0
set xlabel "Message size (Bytes)"  font "Arial, 24"
set ylabel "Tput (Gbps, log scale)" font "Arial, 24" offset graph -0.03, 0
set xtics ("8B" 8, "64B" 64, "512B" 512, "4K" 4096, "32K" 32768, "256K" 262144, "1M" 1048576) font "Arial, 24"
set ytics font "Arial, 24"
set key inside reverse right bottom font "Arial, 24"
set logscale y 10 
set logscale x 2


$linux << EOD
8	0.073486328
16	0.14831543
32	0.288818359
64	0.848144531
128	1.592773438
256	2.90625
512	5.40625
1024	9.53125
2048	16.328125
4096	24.96875
8192	33.375
16384	36.75
32768	35.5
65536	38.5
131072	40
262144	40
524288	40
1048576	40 
EOD

$libvma << EOD
8	0.071472168
16	0.140014648
32	0.285888672
64	0.822753906
128	1.55859375
256	2.767578125
512	4.09375
1024	9.40625
2048	15.65625
4096	24.84375
8192	33.3125
16384	36.25
32768	35.75
65536	36
131072	42
262144	40
524288	40
1048576	40
EOD


$libsd << EOD
8 1.53216
16 1.80736
32 2.7392
64 4.75136
128 9.03168
256 19.7222
512 33.5053
1024 38.3386
2048 39.3216
4096	47.78125
8192	55.9375
16384	110.125
32768	203.75
65536	342.5
131072	463
262144	676
524288	864
1048576	1048
EOD

$rsocket << EOD
8 0.370688
16 0.592384
32 1.08646
64 2.15142
128 4.6039
256 9.83245
512 19.1324
1024 30.1384
2048 23.3636
4096 24.8381
8192 26.0833
16384 28.3116
32768 32.5059
65536 29.8844
131072 17.8258
262144 18.8744
524288 16.7772
1048576 16.7772
EOD

plot "$libsd" title "SocksDirect" with linespoints linestyle 1,\
"$linux" title "Linux" with linespoints linestyle 2, \
"$libvma" title "LibVMA" with linespoints linestyle 3, \
"$rsocket" title "RSocket" with linespoints linestyle 4
