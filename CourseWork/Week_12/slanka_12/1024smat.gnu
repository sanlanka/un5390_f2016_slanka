# 1024smat.gnu
#
# Gnuplot instructions to plot the data in 1024smat.dat.
#
# Usage:
# gnuplot 1024smat.gnu
# Gnuplot terminal and output settings
set term postscript landscape enhanced color dashed 15
set output "1024smat.eps"
# Title, axis label, range and ticks
set title  "Speedup vs Number of processors"
set xlabel "Number of processors, NPROC"
set ylabel "Speedup (Scaled)"
set autoscale x
set autoscale y
set xrange [1:12]
set mxtics 20
# Line styles
set style line 1 lt 1 lc rgb "#A00000" lw 2 pt 7 ps 1.5 
# Legend location and grid
set key top left
set grid back ls 60
# String to identify missing data points, and plot the data
set datafile missing "---"
plot "1024smat.dat" using 1:2 title "N = 1024" with linesp ls 1 lt rgb "#AA4169e1"

