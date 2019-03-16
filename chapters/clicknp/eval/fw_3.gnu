fn = "fw_3"
xlbl = "Load Factor (%)"
ylbl = "Forward Latency (us)"
load "errbar.gnu"
set yrange [0:50]
set xlabel offset 0, graph -0.07
set ylabel offset -3
set tmargin 8
lh = 0.82
set label "415" at graph 0.17, screen lh font "Arial, 30" front
set label "671" at graph 0.34, screen lh font "Arial, 30" front
set label "2K" at graph 0.51, screen lh font "Arial, 30" front
set label "626" at graph 0.68, screen lh font "Arial, 30" front
set label "68K" at graph 0.85, screen lh font "Arial, 30" front
plot for [i=1:4] fn using 3*i-1:3*i:3*i+1:xtic(1) fs pattern 0+word(pat,i) ti columnheader(3*i-1) ls i
