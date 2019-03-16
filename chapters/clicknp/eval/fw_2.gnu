fn = "fw_2"
xlbl = "Packet Size (Byte)"
ylbl = "Processing Rate (Mpps)"
load "lp.gnu"
#set yrange [0.0625:64]
#set logscale y 2 
#set format y "2^{%L}"
#set ytics 0.0625, 4, 64 
#set mytics 4
set key width -0.8
plot for [i=2:5] fn u i:xtic(1) ti columnheader(i) w lp ls i-1
