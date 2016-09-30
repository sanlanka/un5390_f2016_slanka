# iterative_plot_datasets.gnu
# 
# Usage:
# gnuplot iterative_plot_datasets.gnu

set terminal pngcairo dashed size 1280,800 enhanced font 'Helvetica,24'
set output "iterative_plot_datasets.png"
set title  "Iterative plot of multiple data sets"
set xlabel "# of processors"
set ylabel "Speed up"
set yrange [0:21]
set logscale x 2
set key left top
set key autotitle columnhead
set grid

plot for [i=1:7] 'dataset_'.i.'.dat' using 1:2 with lines lw 1
