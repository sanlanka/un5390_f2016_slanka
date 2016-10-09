# machine_epsilon.gnu
#
# Gnuplot instructions to plot the data in performance.dat.
#
# Usage:
# gnuplot machine_epsilon.gnu
# Gnuplot terminal and output settings
set term postscript landscape enhanced color dashed 15
set output "machine_epsilon.eps"
# Title, axis label, range and ticks
set title  "Plot of Epsilon vs Number of Iterations"
set xlabel "Number of Iterations = n"
set ylabel "Epsilon"
set xrange []
set yrange []  
set mxtics 20
# Line styles
set style line 1 lt 1 lc rgb "#A00000" lw 2 pt 7 ps 1.5 
# Legend location and grid
set key top left
set grid back ls 60
# String to identify missing data points, and plot the data
set datafile missing "---"
plot "machine_epsilon.dat" using 1:2 title "epsilon" with linesp ls 1
