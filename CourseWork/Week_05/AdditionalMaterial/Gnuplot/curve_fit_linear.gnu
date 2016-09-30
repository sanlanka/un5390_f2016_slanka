# curve_fit_linear.gnu
# 
# Gnuplot instructions to plot the data contained in 
# curve_fit.dat.
#
# Usage:
# gnuplot curve_fit_linear.gnu

set terminal postscript eps enhanced color "Helvetica" 24
set output "curve_fit_linear.eps"
set size 2.0,2.0
set title  "Curve fit (linear)"
set xlabel "# of processors"
set ylabel "Measured quantity"
set samples 100
set xrange [0:18]
set grid
set key bottom right

fit a*x + b 'curve_fit.dat' using 1:2 via a,b
plot 'curve_fit.dat' using 1:2 title 'Measured data' with points pt 5, a*x + b title 'Curve fit' lw 2 lt 1 lc 5
