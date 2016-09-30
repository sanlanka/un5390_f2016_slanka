# 3d_plot.gnu
# 
# Gnuplot instructions to plot the data contained in 3d_plot.dat.
#
# Usage:
# gnuplot 3d_plot.gnu

set terminal postscript eps enhanced color "Helvetica" 24
set output "3d_plot.eps"
set size 2.0,2.0
set title  "3 dimensional plot"
set xlabel "# of particles"
set ylabel "# of processors"
# set zlabel "Wall Time (seconds)"
set ticslevel 0.2
set grid
set dgrid3d 30,30
set hidden3d
set pm3d
set nokey
splot '3d_plot.dat' using 1:2:3 with pm3d
