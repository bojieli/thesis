fn = "pfabric"
xlbl = "FCT (us, log-scale)"
ylbl = "CDF"
load 'lp_keyin.gnu'
set logscale x
set xrange[1E2:1E6]
set format x "10^{%L}"
set key right bottom
set style data lines
#plot for [i=2:4] fn u 1:i ti columnheader(i) w lp ls i-1
plot  \
NaN ls 2 lw 7 dt 3 title 'Ideal', \
'fct/fct-pfabric' using 1:2 ls 1 lw 5 dt 1 lc rgb 'orange' title 'pFabric', \
'fct/fct-ideal' using 1:2 ls 2 lw 7 dt 3 notitle, \
'fct/fct-tcp' using 1:2 ls 3 lw 7 dt 5 title 'TCP-Droptail'
