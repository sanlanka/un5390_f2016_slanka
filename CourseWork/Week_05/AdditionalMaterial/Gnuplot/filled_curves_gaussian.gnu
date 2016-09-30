# filled_curves_gaussian.gnu
# 
# Usage:
# gnuplot filled_curves_gaussian.gnu

set terminal postscript eps enhanced color "Helvetica" 24
set output "filled_curves_gaussian.eps"
set size 2.0,2.0
set title  "Filled curves (solid)"
set xlabel "x"
set ylabel "Gaussian"

set style fill solid 1.0 noborder
set style function filledcurves y1=0
set clip two

Gauss(x,mu,sigma) = 1./(sigma*sqrt(2*pi)) * exp( -(x-mu)**2 / (2*sigma**2) )
d1(x) = Gauss(x, 0.5, 0.75)
d2(x) = Gauss(x, 1.0, 2.00)
d3(x) = Gauss(x, 4.0, 3.00)

set xrange [-6:10]
set yrange [0:1]
unset colorbox
set key top left Left reverse samplen 1

plot d1(x) fs solid 1.0 lc rgb "forest-green" title "{/Symbol m} =  0.5; {/Symbol s} = 0.5", \
     d2(x) lc rgb "gold" title "{/Symbol m} =  2.0; {/Symbol s} = 1.0", \
     d3(x) lc rgb "red" title "{/Symbol m} = -1.0; {/Symbol s} = 2.0"
