fn = "fw_5"
xlbl = ""
ylbl = "Rule Update Latency (us)"
load "errbar.gnu"
set yrange[1:20000]
set logscale y 10
set format y "10^{%L}"
set ytics (1, 10, 100, 1000, 10000)
set xlabel offset 0, graph -0.05
set ylabel offset -5,-2
set xtics rotate by 30 offset -15,-8
set bmargin 10
set key off
plot for [i=1:1] fn using 3*i-1:3*i:3*i+1:xtic(1) fs pattern 0+word(pat,i) ti columnheader(3*i-1) ls i
