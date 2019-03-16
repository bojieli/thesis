set terminal pdf
set output "nginx-long-tput.pdf"
set title "Throughput with the number of cores (Nginx long connection)"
set xlabel "Number of cores"
set ylabel "Throughput/k connections per sec"
plot sin(x) title "SocksDirect",cos(x) title "Linux socket"