# iterative_plot_sine_filled.gnu
# 
# Usage:
# gnuplot iterative_plot_sine_filled.gnu

set terminal pngcairo size 1280,800 enhanced font 'Helvetica,24'
set output "iterative_plot_sine_filled.png"
set title  "Iterative plot (filled/translucent)"
set xlabel "x"
set ylabel "sin(x*n)/n"
set xrange [0.00:6.28] noreverse nowriteback
set yrange [-1.1:1.1]
set grid
set style fill transparent solid 0.25 noborder
set sample 1000
plot for [n=1:5] sin(x*n)/n notitle with filledcurves
