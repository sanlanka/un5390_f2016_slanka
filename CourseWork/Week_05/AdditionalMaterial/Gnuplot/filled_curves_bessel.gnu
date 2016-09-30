# filled_curves_bessel.gnu
# 
# Usage:
# gnuplot filled_curves_bessel.gnu

set terminal pngcairo size 1280,800 enhanced font 'Helvetica,24'
set output "filled_curves_bessel.png"
set title  "Filled curves (translucent)"
set xlabel "x"
set ylabel "J_n(x)"
set xrange [0:25]
set yrange [-0.5:1]
set grid

set style fill transparent solid 0.25 noborder
set style function filledcurves y1=0
set sample 5000

besj2(x)  = 2*1/x * besj1(x) - besj0(x)
besj3(x)  = 2*2/x * besj2(x) - besj1(x)
besj0_(x) = x<5 ? besj0(x) : 1/0

plot besj0(x) fs transparent solid 0.80 noborder t 'J_0(x)' , \
     besj1(x) fs transparent solid 0.60 noborder t 'J_1(x)' , \
     besj2(x) fs transparent solid 0.40 noborder t 'J_2(x)' , \
     besj3(x) fs transparent solid 0.20 noborder t 'J_3(x)' 
