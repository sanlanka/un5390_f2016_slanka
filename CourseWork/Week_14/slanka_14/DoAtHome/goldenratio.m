%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/12, 5:11PM

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'goldenratio.m'" in the Command Window and provide the inputs. 
%To open the file type "open 'goldenratio'" making sure...
%Matlab's present directory is changed to the 'goldenratio' directory

%calculate golden ratio
format longE
k = 0;
xold = 1;
x = 0;
gr = 1.61803398874989484820;
while ~isnan(x)
    x1 =x;
    x = x + (((-1)^k+1)*factorial(2*k+1))/(factorial(k+2)*factorial(k)*4^(2*k+3));
    k = k + 1;
end
x1 = x1 +13/8;
disp(x1);

%We see that after a point the ratio cannot be calcuated as the number
%turns NaN.