%Euler_Prime.m
%Program to calculate Distance 
%compute prime numbers greater from 41
%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'Euler_Prime.m'" in the Command Window. 
%To open the file type "open 'Euler_Prime.m'" making sure...
%Matlab's present directory is changed to the 'machine_epsilon.m' directory

%slanka for SC1 Assignment_04
%Sat, 2:30AM, 09/10/2016

i=1;
for b = 0:39
    zeta(i) = (b^2 + b + 41); %Eulers Polynomial
    disp(zeta(i));%Display Prime Number
    i = i + 1; %increment i
end

% For b=40:100
for b = 0:95
    zeta(i) = (b^2 + b + 97);
    disp(zeta(i));
    i = i + 1;
end