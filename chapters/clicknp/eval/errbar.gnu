reset
set terminal postscript eps color enhanced
set output fn.".eps"
set yrange [0:]
set xtics font "Arial, 34" offset 0, graph -0.04
set ytics font "Arial, 34"
set bmargin 6
set lmargin 12 
set xlabel xlbl font "Arial, 36"  offset 0, graph -0.08
set ylabel ylbl font "Arial, 36"  offset graph -0.07, 0
set key outside reverse right top horizontal samplen 2.2 width -0.8 font "Arial, 34"
set style data histogram 
set style histogram cluster gap 1 errorbars linewidth 4
set style fill pattern border -1
set bars front
set auto x
pat = "0 1 4 5"
set style line 1 lc rgb "#e41a1c" lw 3 ps 4
set style line 2 lc rgb "#377eb8" lw 3 ps 3
set style line 3 lc rgb "#4daf4a" lw 3 ps 3.5
set style line 4 lc rgb "#984ea3" lw 3 ps 3.5
set style line 5 lc rgb "#ff7f00" lw 3 ps 3.5
set style line 6 lc rgb "#ffff33" lw 3 ps 3.5
set style line 7 lc rgb "#a65628" lw 3 ps 3.5
set style line 8 lc rgb "#f781bf" lw 3 ps 3.5
