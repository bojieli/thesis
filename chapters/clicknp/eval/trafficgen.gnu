fn = "trafficgen"
xlbl = "Packet Size (Byte)"
ylbl = "Throughput (Gbps)"
load 'lp_keyin.gnu'
set yrange [0:60]
set ytics autofreq
plot for [i=2:3] fn u i:xtic(1) ti columnheader(i) w lp ls i-1
