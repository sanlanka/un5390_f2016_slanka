# CoinFlip_Multiple.gnu
#
# Gnuplot instructions to plot the data in performance.dat.
#
# Usage:
# gnuplot CoinFlip_Multiple.gnu
# Gnuplot terminal and output settings
set term postscript landscape enhanced color dashed 15
set output "CoinFlip_Multiple.eps"
# Title, axis label, range and ticks
set title  "Plot of Number of Heads vs Bias factor p"
set xlabel "Value of the Bias factor p"
set ylabel "# Number of heads"
set xrange [-0.1:1.1]
set yrange [-1:12]  
set xtics 0,0.1,1.1
set mxtics 20
# Line styles
set style line 1 lt 1 lc rgb "#A00000" lw 2 pt 7 ps 1.5 
# Legend location and grid
set key top left
set grid back ls 60
# String to identify missing data points, and plot the data
set datafile missing "---"
plot for [col=2:101] "CoinFlip_Multiple.dat" using 1:col notitle with circles lc rgb "red" lw 1
