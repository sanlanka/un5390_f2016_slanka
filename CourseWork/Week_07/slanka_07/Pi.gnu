# pi.gnu
#
# Gnuplot instructions to plot the data in performance.dat.
#
# Usage:
# gnuplot pi.gnu
# Gnuplot terminal and output settings
set term postscript landscape enhanced color dashed 15
set output "pi.eps"
# Title, axis label, range and ticks
set title  "Pi approximation vs Number of Points"
set xlabel "Powers(P),where Number of points N = X^P"
set ylabel "Pi value"
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
plot "Pi.dat" using 1:2 title "Pi" with linesp ls 1


