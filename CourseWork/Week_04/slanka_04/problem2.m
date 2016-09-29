%problem2.m
%Program to calculate Problem 2 
%Prime Numbers

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'problem2.m'" in the Command Window. 
%To open the file type "open 'problem2.m'" making sure...
%Matlab's present directory is changed to the 'problem2.m' directory

%slanka for SC1 Assignment_04
%Wed, 6:54PM, 09/27/2016

 
%Begin
%%
d = 5; % Specify the Number d
fpc = 0;
for a = 0:d %loop through the numbers upto d one at a time
    c = 0; %set counter c = 0
    for  b = 1:a %Inner loop to divide the number by the numbers upto itself
        fpc = fpc+1; %Calculate the number of floating point Operations a/b
        %By default MATLAB's data type is double so every divison
        %is considered a Floating Point operation
       if mod(a,b) == 0 
         c = c+1; %increment counter if a is integer divisible by a
       end
    end
      if c == 2 %if couter is equal to 2 the number is a prime number
          disp(a);
      end
end
disp(fpc);%display the Floating point operations counter
%%
%end
    