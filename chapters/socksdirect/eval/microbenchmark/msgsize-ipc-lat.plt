set terminal pdf
set output "msgsize-ipc-lat.pdf"
set lmargin 12
set rmargin 3.5
set style line 1 pt 8 lc rgb "#e41a1c" linewidth 1.5 ps 1.0 
set style line 2 pt 4 lc rgb "#377eb8" linewidth 1.5 ps 1.0 
set style line 3 pt 6 lc rgb "#4daf4a" linewidth 1.5 ps 1.0 
set style line 4 pt 12 lc rgb "#984ea3" linewidth 1.5 ps 1.0
set style line 5 pt 10 lc rgb "#ff7f00" linewidth 1.5 ps 1.0
set style line 6 pt 14 lc rgb "#ffff33" linewidth 1.5 ps 1.0
set style line 7 pt 13 lc rgb "#a65628" linewidth 1.5 ps 1.0
set style line 8 pt 13 lc rgb "#f781bf" linewidth 1.5 ps 1.0
set xlabel "Message size (Bytes)"  font "Arial, 24"
set ylabel "Latency ({/Symbol m}s, log scale)" font "Arial, 24" offset graph -0.02, 0
set xtics ("8B" 8, "64B" 64, "512B" 512, "4K" 4096, "32K" 32768, "256K" 262144, "1M" 1048576) font "Arial, 24"
set ytics font "Arial, 24"
set key inside reverse left top font "Arial, 20"
set logscale y 10 
set logscale x 2

$linux << EOD
8 11.63 10.98 13.43
16 11.80 11.03 13.75
32 11.70 11.05 13.92
64 11.66 11.02 15.14
128 11.89 11.15 14.49
256 11.86 11.13 13.53
512 11.92 11.24 14.78
1024 12.03 11.26 18.40
2048 12.94 12.15 24.97
4096 13.65 12.80 25.69
8192 15.73 14.10 23.07
16384 19.37 16.57 26.10
32768 24.13 22.22 36.11
65536 47.05 42.50 55.56
131072 54.62 53.11 62.88
262144 95.74 88.81 109.31
524288 172.49 164.90 200.69
1048576 321.70 314.53 355.89
EOD

$libvma << EOD
8 2.60 2.34 3.32
16 2.70 2.42 3.41
32 2.68 2.40 3.98
64 2.80 2.49 3.54
128 2.90 2.63 4.23
256 3.50 3.25 4.84
512 3.77 3.52 4.45
1024 4.15 3.89 5.47
2048 5.63 5.35 6.58
4096 7.24 6.79 9.79
8192 11.15 9.92 14.71
16384 17.10 15.70 20.91
32768 28.82 26.25 36.44
65536 51.01 47.21 61.85
131072 105.06 99.10 118.53
262144 204.74 196.86 218.15
524288 403.73 387.28 426.00
1048576 763.57 731.99 790.50
EOD

$libsd << EOD
8	0.2983	0.232	0.389
16	0.3318	0.299	0.426
32	0.8357	0.72	0.942
64	0.9282	0.805	1.077
128	0.8969	0.765	1.042
256	0.8131	0.676	0.98
512	0.9415	0.811	1.066
1024	1.1627	1.043	1.311
2048	1.6302	1.471	1.823
4096	2.5376	2.374	2.819
8192	4.2117	4.022	6.085
16384	4.2778	4.085	6.198
32768	4.8076	4.576	6.713
65536	5.5486	5.234	7.781
131072	6.8876	6.443	9.807
262144	9.9083	9.171	15.207
524288	16.5117	14.689	26.097
1048576	25.2598	21.176	32.385
EOD

$rsocket << EOD
8 1.95973 1.882 2.048
16 1.85594 1.715 1.92
32 1.93025 1.79 3.148
64 2.33468 2.22 4.158
128 2.92008 2.697 5.799
256 2.89834 2.579 5.148
512 3.31133 2.737 5.96
1024 5.23835 3.569 11.335
2048 12.0943 6.625 25.884
4096 13.6896 8.746 24.48
8192 27.5284 24.997 34.456
16384 37.9034 35.478 45.571
32768 60.378 53.946 69.882
65536 64.6027 32.472 94.757
131072 69.6865 65.241 76.553
262144 117.282 111.297 132.029
524288 220.648 207.071 273.865
1048576 423.916 402.16 569.967
EOD

plot "$libsd" title "SocksDirect" with yerrorlines linestyle 1,\
"$linux" title "Linux" with yerrorlines linestyle 2,\
"$libvma" title "LibVMA" with yerrorlines linestyle 3,\
"$rsocket" title "RSocket" with yerrorlines linestyle 4