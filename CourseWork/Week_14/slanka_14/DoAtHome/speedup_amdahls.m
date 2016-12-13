%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/12, 10:10PM

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'speedup_amdahls.m'" in the Command Window and provide the inputs. 
%To open the file type "open 'speedup_amdahl's.m'" making sure...
%Matlab's present directory is changed to the 'speedup_amdahl's' directory

function [T]=speedup_amdahls(P,Nmin,Nmax)
clc;
Nmin = 1; %min number of processors
Nmax = 3; %max number of processors

Speedups = zeros((2^Nmax-2^Nmin)+1,1);
for i = Nmin:Nmax
Speedup(i) = 1/((1-P)+(P/2^i));
end

for i = Nmin:Nmax
    fprintf('Speedup for %d Processors according to Amdahls law = %f \n\n',2^i,Speedup(i));
end

%end