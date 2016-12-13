%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/12, 8:14PM

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'bugsinquadratic.m'" in the Command Window and provide the inputs. 
%To open the file type "open 'quadratic'" making sure...
%Matlab's present directory is changed to the 'bugsinquadratic' directory
clear;
clc;
%calculate golden ratio
a = 3;
b = 3;
c = 3;

x1 = (-b + sqrt(b^2-4*a*c))/(2*a);
x2 = (-b - sqrt(b^2-4*a*c))/(2*a);

disp(x1);
disp(x2);

%The main issues with using this formula is:
% 1. a could be 0(zero) which will cause an error
% 2. somtimes if the number is too small, it might touch Machine epsilon
