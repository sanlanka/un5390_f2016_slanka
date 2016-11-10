% HelloWorld_s.m
%
% MATLAB script m file to display "Hello, World!" using a single processor.
%
% Compilation (not necessary) and execution (from a Terminal)
%   matlab -nodisplay -nosplash -singleCompThread -r HelloWorld_s \
%     -logfile HelloWorld_s.log
%
% Tested successfully using MATLAB R2016a on feynman.it.mtu.edu
%   Red Hat Enterprise Linux Server 7.2 (Maipo)
%   OS and software architecture: x86_64
%   4 cores of Intel(R) Xeon(R) CPU E5-1620 3.60GHz and 64 GB RAM
%   NVIDIA GeForce GTX 570

% Start the timer
tic

% Display "Hello, World!" 
disp('Hello, World!')

% Stop the timer
toc

% Exit MATLAB (Comment the line below if running interactively)
exit
