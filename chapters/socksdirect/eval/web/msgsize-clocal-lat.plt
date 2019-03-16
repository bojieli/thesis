set terminal pdf
set output "msgsize-clocal-lat.pdf"
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
set ylabel "Latency ({/Symbol m}s, log scale)" font "Arial, 24" offset graph -0.05, 0
set xtics ("8B" 8, "64B" 64, "512B" 512, "4K" 4096, "32K" 32768, "256K" 262144, "1M" 1048576) font "Arial, 24"
set ytics font "Arial, 24"
set key inside reverse left top font "Arial, 24"
set yrange [10:1000]
set logscale y 10 
set logscale x 2

$linux << EOD
32 82.070 71.201 216.083
64 77.581 69.979 128.949
128 78.629 69.349 212.296
256 77.382 65.582 208.345
512 74.989 65.603 205.266
1024 83.301 74.117 200.406
2048 79.404 69.112 206.849
4096 95.446 74.939 226.778
8192 84.590 73.781 219.762
16384 103.495 95.193 239.486
32768 113.914 98.717 221.596
65536 175.228 151.920 295.549
131072 201.996 162.857 356.303
262144 313.141 247.412 498.180
524288 529.586 467.626 654.093
1048576 844.109 740.123 1012.283
EOD

$libsd << EOD
32 15.298 13.090 26.152
64 14.533 12.491 20.924
128 14.388 12.472 19.312
256 14.671 12.679 19.389
512 14.128 12.274 18.443
1024 16.848 14.767 27.089
2048 16.485 14.336 26.256
4096 18.283 16.164 25.064
8192 21.298 18.449 32.466
16384 23.096 20.360 30.006
32768 21.607 18.915 32.904
65536 30.315 20.548 52.993
131072 27.429 22.857 44.402
262144 27.387 24.428 43.977
524288 33.838 28.591 46.305
1048576 42.726 38.192 60.972
EOD


plot "$libsd" title "SocksDirect" with yerrorlines linestyle 1,\
"$linux" title "Linux" with yerrorlines linestyle 2
