# CoinFlip_single.gnu
#
# Gnuplot instructions to plot the data in performance.dat.
#
# Usage:
# gnuplot CoinFlip_single.gnu
# Gnuplot terminal and output settings
set term postscript landscape enhanced color dashed 15
set output "CoinFlip_single.eps"
# Title, axis label, range and ticks
set title  "Plot of Number of Heads vs the Probabilty of getting heads"
set xlabel "Number of Heads obtained by fliping the coin 10^m times, m =1,2,3"
set ylabel "P(No. of Heads obtained by flipping the coin)"
set xrange [0:400]
set yrange []  
set mxtics 20
# Line styles
set style line 1 lt 1 lc rgb "#A00000" lw 2 pt 7 ps 1.5 
# Legend location and grid
set key top left
set grid back ls 60
# String to identify missing data points, and plot the data
set datafile missing "---"
plot "CoinFlip_single.dat" using 1:2 title "P(Getiing h number of heads)" with linesp ls 1
