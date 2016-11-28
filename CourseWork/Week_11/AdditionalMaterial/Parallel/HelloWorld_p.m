% HelloWorld_p.m
%
% MATLAB script m file to display "Hello, World!" using 'parfor' loop.
%
% Compilation (not necessary) and execution (from a Terminal)
%   matlab -nodisplay -nosplash -r HelloWorld_p -logfile HelloWorld_p.log
%
% Tested successfully using MATLAB R2016a on feynman.it.mtu.edu
%   Red Hat Enterprise Linux Server 7.2 (Maipo)
%   OS and software architecture: x86_64
%   4 cores of Intel(R) Xeon(R) CPU E5-1620 3.60GHz and 64 GB RAM
%   NVIDIA GeForce GTX 570

% Start the timer
tic

% Variables declaration and initialization
NPROC = 4;

% Open the PARPOOL with NPROC workers
parpool('local', NPROC)

% Display "Hello, World!" 
parfor (i = 1:NPROC)
  disp('Hello, World!')
end

% Stop the timer
toc

% Exit MATLAB (Comment the line below if running interactively)
exit
