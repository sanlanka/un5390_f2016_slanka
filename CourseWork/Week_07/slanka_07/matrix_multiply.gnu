# matrix_multiply.gnu
#
# Gnuplot instructions to plot the data in performance.dat.
#
# Usage:
# gnuplot CoinFlip_single.gnu
# Gnuplot terminal and output settings
set term postscript landscape enhanced color dashed 15
set output "matrix_multiply.eps"
# Title, axis label, range and ticks
set title  "Time vs Size of Matrix"
set xlabel "Size of Matrix(NxN)"
set ylabel "log(Time(Secs))"
set xrange []
set yrange [] 
#set mxtics 10
set mxtics 10
set xtics 100
# Line styles
set style line 1 lt 1 lc rgb "#A00000" lw 2 pt 20 ps 0.50
# Legend location and grid
set key top left
set grid back ls 60
#set grid mytics ytics ls 100,ls 101
# String to identify missing data points, and plot the data
set datafile missing "---"
plot "stamps.dat" using 1:(log($2)) title "log(Time(secs)) vs N " with linesp ls 1
