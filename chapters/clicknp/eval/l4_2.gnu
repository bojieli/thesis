fn = "l4_2"
xlbl = "Concurrent Flows"
ylbl = "Processing Rate (Mpps)"
load "lp.gnu"
unset mytics
set bmargin 6
set lmargin 20
set key width -3.5 font "Arial, 32"
set logscale y
set key width 0
set ytics offset graph 0, 0 font "Arial, 30"
set ylabel offset graph -0.04, 0 font "Arial, 34"
plot for [i=2:3] fn u i:xtic(1) ti columnheader(i) w lp ls i-1
