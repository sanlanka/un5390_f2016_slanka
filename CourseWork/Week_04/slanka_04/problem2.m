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
d = 30; % Specify the Number d
fpc = 0;
fprintf('\n Output from approach 1\n');
for a = 2:d %loop through the numbers upto d one at a time
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
fprintf('\nNumber of Floating Point Operations \n=%d \n',fpc);%display the Floating point operations counter

%% for b = a/2
fpc1 =0;
fprintf('\n Output from approach 2\n');
for a = 2:d %loop through the numbers upto d one at a time
    c = 0; %set counter c = 0
    for  b = 1:a/2%Inner loop to divide the number by the numbers upto itself
        fpc1 = fpc1+1; %Calculate the number of floating point Operations a/b
        %By default MATLAB's data type is double so every divison
        %is considered a Floating Point operation
       if mod(a,b) == 0 
         c = c+1; %increment counter if a is integer divisible by a
       end
    end
      if c == 1 %if couter is equal to 2 the number is a prime number
          disp(a);
      end
end
%% 
fprintf('\nNumber of Floating Point Operations taking "a = d/2":\n =%d \n',fpc1);%display the Floating point operations counter

fprintf('\nNumber of Floating point operations have been reduced by:\n %d\n',(fpc-fpc1));
%end
    