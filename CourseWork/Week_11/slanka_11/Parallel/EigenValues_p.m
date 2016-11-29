% EigenValues_p.m
%
% MATLAB script m file to make an array of the maximum of the absolute
% eigen values of a random NxN matrix using 'parfor' loop to speed up time to
% solution.
%
% eig(A) regurns a column vector containing the eigen values of square matrix A.
% rand(N) produces a NxN matrix of random floating-point numbers.
% abs(M) returns the absolute value of M.
% max(a, b, c, d) returns the maximum value of the array.
% zeros(N, 1) produces a Nx1 vector of zeros.
%
% Compilation (not necessary) and execution (from a Terminal)
%   matlab -nodisplay -nosplash -r EigenValues_p -logfile EigenValues_p.log
%
% Tested successfully using MATLAB R2016a on feynman.it.mtu.edu
%   Red Hat Enterprise Linux Server 7.2 (Maipo)
%   OS and software architecture: x86_64
%   4 cores of Intel(R) Xeon(R) CPU E5-1620 3.60GHz and 64 GB RAM
%   NVIDIA GeForce GTX 570

% Variables declaration and initialization
NPROC = 4;
N     = 2048;
a     = zeros(N, 1);

% Open the PARPOOL with NPROC workers
parpool('local', NPROC)

% Start the timer
tic

% Start parallel for loop 
parfor (i = 1:N)
  a(i) = max(abs(eig(rand(300))));
end
% End parallel for loop

% Stop the timer
toc

% Exit MATLAB (Comment the line below if running interactively)
exit
