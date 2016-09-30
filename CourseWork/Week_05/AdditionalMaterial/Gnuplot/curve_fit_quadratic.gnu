# curve_fit_quadratic.gnu
# 
# Gnuplot instructions to plot the data contained in 
# curve_fit.dat.
#
# Usage:
# gnuplot curve_fit_quadratic.gnu

set terminal postscript eps enhanced color "Helvetica" 24
set output "curve_fit_quadratic.eps"
set size 2.0,2.0
set title  "Curve fit (quadratic)"
set xlabel "# of processors"
set ylabel "Measured quantity"
set samples 100
set xrange [0:18]
set grid
set key bottom right

fit a*x*x + b*x + c 'curve_fit.dat' using 1:2 via a,b,c
plot 'curve_fit.dat' using 1:2 title 'Measured data' with points pt 5, a*x*x + b*x + c title 'Curve fit' lw 2 lt 1 lc 5
