fn = "dump"
xlbl = "Packet Size (Byte)"
ylbl = "Processing Rate (Mpps)"
load "lp_keyin.gnu"
plot for [i=2:6] fn using i:xtic(1) ti columnheader(i) w lp ls i-1
