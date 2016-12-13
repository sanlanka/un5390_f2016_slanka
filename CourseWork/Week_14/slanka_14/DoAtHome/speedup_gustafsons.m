%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/12, 10:10PM

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'speedup_gustafsons.m'" in the Command Window and provide the inputs. 
%To open the file type "open 'speedup_gustafsonss.m'" making sure...
%Matlab's present directory is changed to the 'speedup_gustafsons' directory

function [T]=speedup_gustafsons(P,Nmin,Nmax)
clc;
Nmin = 1; %min number of processors
Nmax = 3; %max number of processors

Speedups = zeros((2^Nmax-2^Nmin)+1,1);
for i = Nmin:Nmax
Speedup(i) = 2^i-((1-P)*(2^i-1));
end

for i = Nmin:Nmax
    fprintf('Speedup for %d Processors According to Gustafsons law = %f \n\n',2^i,Speedup(i));
end

%end