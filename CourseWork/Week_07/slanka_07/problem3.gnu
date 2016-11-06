# CoinFlip_single.gnu
#
# Gnuplot instructions to plot the data in performance.dat.
#
# Usage:
# gnuplot CoinFlip_single.gnu
# Gnuplot terminal and output settings
set term postscript landscape enhanced color dashed 15
set output "T.eps"
# Title, axis label, range and ticks
set title  "Temperature vs Time"
set xlabel "Time(mins)"
set ylabel "Temperature(^oF)"
set xrange []
set yrange [] 
set xtic 20
set ytic 10
set mxtics 20
set mxtics 20
# Line styles
set style line 1 lt 1 lc rgb "#A00000" lw 2 pt 20 ps 0.50
# Legend location and grid
set key top left
set grid back ls 60
set grid mytics ytics ls 100,ls 101
# String to identify missing data points, and plot the data
set datafile missing "---"
plot "T.dat" using 1:2 title "Temperature" with linesp ls 1
