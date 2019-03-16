fn = "pcie_2"
xlbl = "Batch Size (Byte)"
ylbl = "Latency (us)"
load 'lp.gnu'
set yrange [1E-1:1E4]
set logscale x 2
set logscale y 10 
set format x "2^{%L}"
set format y "10^{%L}"
set xrange [64:65536]
set xtics 64, 2, 65536 offset graph 0, -0.05
set xtics ("64" 64, "" 128, "256" 256, "" 512, "1K" 1024, "" 2048, "4K" 4096, "" 8192, "16K" 16384, "" 32768, "64K" 65536)
set ytics 1E-4, 10, 1E4 offset graph -0.01, 0
unset mytics
set xlabel offset 0, graph -0.055
set ylabel offset graph -0.095, 0
set key width -3
plot for [i=2:4] fn u 1:i ti columnheader(i) w lp ls i-1
