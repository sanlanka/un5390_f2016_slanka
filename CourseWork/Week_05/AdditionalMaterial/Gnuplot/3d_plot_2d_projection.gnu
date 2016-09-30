# 3d_plot_2d_projection.gnu
# 
# Gnuplot instructions to plot the data contained in 
# 3d_plot_2d_projection.dat.
#
# Usage:
# gnuplot 3d_plot_2d_projection.gnu

set terminal postscript eps enhanced color "Helvetica" 24
set output "3d_plot_2d_projection.eps"
set size 2.0,2.0
set title  "2 dimensional heat map"
set xlabel "# of particles"
set ylabel "# of processors"
set ticslevel 0.2
set grid
set dgrid3d
set hidden3d
set pm3d map
set nokey
splot '3d_plot_2d_projection.dat' using 1:2:3 with pm3d
