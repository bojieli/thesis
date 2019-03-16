fn = "ipsec_1"
xlbl = "Packet Size (Byte)"
ylbl = "Throughput (Gbps)"
load "lp.gnu"
set logscale y
set yrange [0.1:100]
unset mytics
set ylabel offset graph -0.07, 0
set key width -0.9 
plot for [i=2:3] fn u i:xtic(1) ti columnheader(i) w lp ls i-1
