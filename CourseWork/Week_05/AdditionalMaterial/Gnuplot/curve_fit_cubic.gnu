# curve_fit_cubic.gnu
# 
# Gnuplot instructions to plot the data contained in 
# curve_fit.dat.
#
# Usage:
# gnuplot curve_fit_cubic.gnu

set terminal postscript eps enhanced color "Helvetica" 24
set output "curve_fit_cubic.eps"
set size 2.0,2.0
set title  "Curve fit (cubic)"
set xlabel "# of processors"
set ylabel "Measured quantity"
set samples 100
set xrange [0:18]
set grid
set key bottom right

fit a*x*x*x + b*x*x + c*x + d 'curve_fit.dat' using 1:2 via a,b,c,d
plot 'curve_fit.dat' using 1:2 title 'Measured data' with points lc 4 pt 5, a*x*x*x + b*x*x + c*x + d title 'Curve fit' lw 2 lt 1 lc 8
