# iterative_plot_sine_lines.gnu
# 
# Usage:
# gnuplot iterative_plot_sine_lines.gnu

set terminal pngcairo size 1280,800 enhanced font 'Helvetica,24'
set output "iterative_plot_sine_lines.png"
set title  "Iterative plot (lines)"
set xlabel "x"
set ylabel "sin(x*n)/n"
set xrange [0.00:6.28] noreverse nowriteback
set yrange [-0.6:0.6]
set grid
set style data lines
set sample 500
plot for [n=2:10] sin(x*n)/n notitle lw (13-n)/2
