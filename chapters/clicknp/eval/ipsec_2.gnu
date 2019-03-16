fn = "ipsec_2"
xlbl = "Load Factor (%)"
ylbl = "Latency (us)"
load "errbar.gnu"
set yrange[2:32768]
set logscale y 10
set format y "10^{%L}"
set ytics (1, 10, 100, 1000, 10000) 
set xlabel offset 0, graph -0.05
plot for [i=1:2] fn using 3*i-1:3*i:3*i+1:xtic(1) fs pattern 0+word(pat,i) ti columnheader(3*i-1) ls i
