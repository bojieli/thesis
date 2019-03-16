fn = "l4_1"
xlbl = "Offered Load (pps)"
ylbl = "Latency (us)"
load "errbar.gnu"
set key samplen 3 
set yrange[1E0:1E5]
set logscale y
set format y "10^{%L}"
set xlabel offset 0, graph -0.06
unset mytics
plot \
fn using 2:3:4:xtic(1) fs pattern 0+word(pat,1) ti columnheader(2) ls 1, \
fn using 5:6:7:xtic(1) fs pattern 0+word(pat,2) ti columnheader(5) ls 2, \
