%exp_x.m
%Program to calculate e value
%exp_x.m

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'exp_x.m'" in the Command Window. 
%To open the file type "open 'exp_x.m'" making sure...
%Matlab's present directory is changed to the 'exp_x.m' directory

%slanka for SC1 Assignment_04
%Wed, 9:24PM, 09/27/2016

%Begin
x = 1; %power of e
ee = 1; %e value
%e calculated by the first approximation for e
for k = 1:50
    ee = ee + x^k/factorial(k);
end
disp('"e" value from the first Approximation:');
disp(ee)

% e calculated by the second Approximation
syms n; %symbolic n
power = 10^308;
e = limit((1 + (1/n))^n,n,power);
disp('"e" value from the Second Approximation:');
disp(double(e));
%End