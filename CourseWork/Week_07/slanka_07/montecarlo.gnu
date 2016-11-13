# montecarlo.gnu
#
# Gnuplot instructions to plot the data in performance.dat.
#
# Usage:
# gnuplot machine_epsilon.gnu
# Gnuplot terminal and output settings
set term postscript landscape enhanced color dashed 15
set output "Error.eps"
# Title, axis label, range and ticks
set title  "Error vs Number of Points"
set xlabel "Powers(P),where Number of points N = X^P"
set ylabel "Error"
set autoscale x
set autoscale y
set mxtics 20
# Line styles
set style line 1 lt 1 lc rgb "#A00000" lw 2 pt 7 ps 1.5 
# Legend location and grid
set key top left
set grid back ls 60
# String to identify missing data points, and plot the data
set datafile missing "---"
plot "Error.dat" using 1:2 title "Error" with linesp ls 1


