%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/12, 1:14PM


%problem #8 in assingment #7
%MATLAB function to convert a Floating point Number into a Binary Mantissa

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'onetenth.m'" in the Command Window and provide the inputs. 
%To open the file type "open 'onetenth'" making sure...
%Matlab's present directory is changed to the 'onetenth' directory

%To find the closest value to .1 in powers of 2
num = 2^-4 + 2^-5 + 2^-8;
i = -10;
while num < 0.1
    num = num + 2^(i);
    i   = i - 1;
    
    if (i == -(10*5))
        break;
    end
end

if num > 0.1
    a = a - 2^(i + 1);
    i = i + 1;
end
disp('The closest value to 0.1 is:');
disp(num);
%end