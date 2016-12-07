%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/5, 1:14PM

%MATLAB function to convert a Floating point Number into a Binary Mantissa

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'float2bin.m'" in the Command Window and provide the inputs. 
%To open the file type "open 'float2bin'" making sure...
%Matlab's present directory is changed to the 'timings' directors
function [bin] = float2bin(fpnum)
fpnum; % your float point number
n = 16;         % number bits for integer part of your number      
m = 20;         % number bits for fraction part of your number
% binary number
d2b = [ fix(rem(fix(fpnum)*pow2(-(n-1):0),2)), fix(rem( rem(fpnum,1)*pow2(1:m),2))];  % 
% the inverse transformation
b2d = d2b*pow2([n-1:-1:0 -(1:m)].');
bin = d2b;
disp(d2b);
end