 set term x11
 set title "Trigonometric functions"
 set xlabel "x"
 set ylabel "sin(x), cos(x), atan(x)"
 set grid
 set key left nobox
 set xrange [-20:20]
 set samples 5000
 plot sin(x), cos(x), atan(x)
