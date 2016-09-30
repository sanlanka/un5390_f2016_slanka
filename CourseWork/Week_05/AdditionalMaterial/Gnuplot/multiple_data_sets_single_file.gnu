# multiple_data_sets_single_file.gnu
# 
# Gnuplot instructions to plot the data contained in 
# multiple_data_sets_single_file.dat.
#
# Usage:
# gnuplot multiple_data_sets_single_file.gnu

set terminal postscript eps enhanced color "Helvetica" 24
set output "multiple_data_sets_single_file.eps"
set size 2.0,2.0
set title  "Multiple sets of data points from one file"
set xlabel "# of processors"
set ylabel "Time (seconds)"
set xrange [0:18]
set grid
plot 'multiple_data_sets_single_file.dat' using 1:2 title "# of particles = 6"  with linesp lt 1 pt 5, \
     'multiple_data_sets_single_file.dat' using 1:3 title "# of particles = 8"  with linesp lt 2 pt 4, \
     'multiple_data_sets_single_file.dat' using 1:4 title "# of particles = 10" with linesp lt 3 pt 3
