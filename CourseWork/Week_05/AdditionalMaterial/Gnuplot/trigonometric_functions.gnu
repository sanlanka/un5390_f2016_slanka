# trigonometric_functions.gnu
# 
# Usage:
# gnuplot trigonometric_functions.gnu

set terminal postscript eps enhanced color "Helvetica" 24
set output "trigonometric_functions.eps"
set size 2.0,2.0
set title  "Trigonometric functions"
set xlabel "x"
set ylabel "sin(x), arctan(x), cos(arctan(x))"
set xrange [0:18]
set grid
set key outside
plot [-15:15] sin(x) title "sin(x)" with linesp lt 8 pt 5, \
              atan(x) title "arctan(x)" with linesp lt 3 pt 4, \
              cos(atan(x)) title "cos(arctan(x))" with impulses lt 9
