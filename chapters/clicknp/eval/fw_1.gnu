fn = "fw_1"
xlbl = "Number of Wildcard Rules"
ylbl = "Processing Rate (Mpps)"
load "lp.gnu"
set rmargin 6.5
set yrange [0.0625:128]
set logscale y 2 
set format y "2^{%L}"
set ytics 0.0625, 4, 64  
set key width -1.1
plot for [i=2:5] fn u i:xticlabels(1) ti columnheader(i) w lp ls i-1
