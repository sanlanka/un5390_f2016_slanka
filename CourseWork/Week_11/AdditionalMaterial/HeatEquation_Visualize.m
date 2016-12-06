% HeatEquation_Visualize.m
%
% MATLAB script m file to read the file 'HeatEquation.dat' one data set at a
% time and plot it repeatedly to create a visualization. 
% Tested with MATLAB R2015b.
%
% Input:
% 'HeatEquation.dat' which has the following format:
% 
% TSTEPS=TSTEPS/10 + 1
% u(x,y) at t = 0 
% u(x,y) at t = 1
% u(x,y) at t = 2
% ...
% u(x,y) at t = TSTEPS
%
% Execution:
% From within MATLAB in the command window
%   cd /folder/containing/this/file
%   HeatEquation_Visualize

% Clear previously set variables and the command window
clear
clc
 
% Open the data file for reading
filename   = 'HeatEquation.dat';
fileHandle = fopen(filename, 'r');
 
% Count the number of time steps (given in the first line)
TSTEPS = fscanf(fileHandle, 'TSTEPS=%d\n', 1);
 
% This is the number of rowns and columns in each block of data
N = 16;
 
% x and y grids for the mesh (3D) plot
x = 1:1:N;
y = 1:1:N;
 
% Generate X and Y arrays for 3D plot
% http://www.mathworks.com/help/techdoc/ref/meshgrid.html
[X, Y] = meshgrid(x,y);
 
% Loop through the data file to read 'N x N' elements at once and import 
% them into 'TSTEPS' number of matrices of order N
for i = 1:TSTEPS
 
  % Initialize all elements of matrix (of order N) to zero
  Temperature(i).Z = zeros(N, N);
 
  % Scan the data file, read 'N x N' elements, treat them as double
  % precision and store them in the matrix
  Temperature(i).Z = fscanf(fileHandle, '%f', [N, N]);
 
  % Plot the data in the above matrix as a function of X and Y
  figure = figure(1);
  mesh(X, Y, Temperature(i).Z)
 
  % Handle for asix property so that it can be modified
  ap = gca;
 
  % Axes limits, labels and title
  set(ap, 'XLimMode', 'manual', 'YLimMode', 'manual', ...
          'ZLimMode', 'manual', ...
          'Xlim', [0 20], 'Ylim', [0 20], 'Zlim', [0 1000000], ...
          'FontSize', 14)
  xlabel('Grid points along x-axis');
  ylabel('Grid points along y-axis');
  zlabel('U(x, y)');
  title(['TSTEP= ' num2str(i)]);
 
  % Color map
  % http://www.mathworks.com/help/techdoc/ref/colormap.html
  colormap(hsv(65536))
 
  % Display a color bar that will serve as a legend
  colorbar
 
  % Saving the plot for every frame will make the code run very slow
  if (i == 1 | i == 70 | i == 205)
    saveas(figure, sprintf('HeatEquation_%04d.png', i));
  end

  % Pause between successive plots
  pause(0.00001);
end 
 
% Close the data file
fclose(fileHandle);
