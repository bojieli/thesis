fn = "fw_4"
xlbl = "Packet Size (Byte)"
ylbl = "Forward Latency (us)"
load "errbar.gnu"
set yrange [0:100]
set xlabel offset 0, graph -0.07
set ylabel offset graph -0.05, 0
set ytics 0, 20, 100
set tmargin 8
lh = 0.82
set label "68K" at graph 0.14, screen lh font "Arial, 30" front
set label "69K" at graph 0.28, screen lh font "Arial, 30" front
set label "68K" at graph 0.42, screen lh font "Arial, 30" front
set label "67K" at graph 0.56, screen lh font "Arial, 30" front
set label "67K" at graph 0.70, screen lh font "Arial, 30" front
set label "67K" at graph 0.84, screen lh font "Arial, 30" front
plot for [i=1:4] fn using 3*i-1:3*i:3*i+1:xtic(1) fs pattern 0+word(pat,i) ti columnheader(3*i-1) ls i
