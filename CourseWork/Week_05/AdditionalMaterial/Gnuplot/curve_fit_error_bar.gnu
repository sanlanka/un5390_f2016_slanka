# curve_fit_error_bar.gnu
# 
# Gnuplot instructions to plot the data contained in 
# curve_fit_error_bar.dat with error bars.
#
# Usage:
# gnuplot curve_fit_error_bar.gnu

set terminal postscript eps enhanced color "Helvetica" 24
set output "curve_fit_error_bar.eps"
set size 2.0,2.0
set title  "Linear curve fit and error bar"
set xlabel "# of processors"
set ylabel "Measured quantity"
set samples 100
set xrange [0:18]
set grid

fit a*x + b 'curve_fit_error_bar.dat' using 1:2:3 via a,b
plot 'curve_fit_error_bar.dat' title 'Error bar' with errorbars lw 2, a*x + b title 'Curve fit' lw 2 lt 1 lc 3
