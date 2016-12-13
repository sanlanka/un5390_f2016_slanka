%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/12, 9:17PM

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'Search.m'" in the Command Window and provide the inputs. 
%To open the file type "open 'Search.m'" making sure...
%Matlab's present directory is changed to the 'Search' directory
clear;
clc;
arrayNum = [34,5,67,23,34,232,121,22,68,0,64,32,54,6,8];

[l] = length(arrayNum);
element = 6;

arrayNum1 = arrayNum(1:floor(l/4));
arrayNum2 = arrayNum(ceil(l/4+1):floor(l/2));
arrayNum3 = arrayNum(ceil(l/2+1):floor(3*l/4));
arrayNum4 = arrayNum(ceil(3*l/4+1):l);

% Divide the space into multiple small fragments and search at the same
% time
for i = 1:l/4
   if(arrayNum1(i) == element)
      ind = ceil(i);
   elseif(arrayNum2(i) == element)
       ind = ceil(l/4+i);
   elseif(arrayNum3(i) == element)
       ind = ceil(2*l/4+i);
   elseif(arrayNum4(i) == element)
       ind = ceil(3*l/4+i);
   end
end
%Print the index and value
fprintf('the element is at the index %d',ind);
disp(arrayNum(ind));

%end
