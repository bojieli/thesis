fn = "l4_3"
xlbl = "New Connections/s"
ylbl = "Allocations/s"
load "lp.gnu"
set lmargin 20
set logscale y 2
set logscale x 2
set xrange [1024:67108864]
set yrange [512:67108864]
set xtics ("1K" 1024, "" 4096, "16K" 16384, "" 65536, "256K" 262144, "" 1048576, "4M" 4194304, "" 16777216, "56M" 56400000) scale 2
set ytics ("1K" 1024, "" 4096, "16K" 16384, "" 65536, "256K" 262144, "" 1048576, "4M" 4194304, "" 16777216, "64M" 67108864) scale 2
unset mytics
set ytics offset graph -0.01, 0
set ylabel offset graph -0.11, 0
set key width -0.7 
plot for [i=2:3] fn u 1:i ti columnheader(i) w lp ls i-1
