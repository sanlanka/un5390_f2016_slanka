# filled_curves_probability.gnu
# 
# Usage:
# gnuplot filled_curves_probability.gnu

set terminal pngcairo size 1280,800 enhanced font 'Helvetica,24'
set output "filled_curves_probability.png"
set title  "Filled curves (translucent)"
set xlabel "x"
set ylabel "Probability Intensity, f(v)"
set grid
set key top right
set style fill transparent solid 0.5 noborder

f(v,T)=4/sqrt(pi*T**3)*exp(-v**2/T)*v**2
set sample 500
plot [0:5] f(x,0.1) with filledcurves x1 title "T=0.1",\
           f(x,1)   with filledcurves x1 title "T=1.0",\
           f(x,5)   with filledcurves x1 title "T=5.0"
