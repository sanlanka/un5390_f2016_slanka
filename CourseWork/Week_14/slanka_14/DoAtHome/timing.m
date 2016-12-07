%UN5390 
%Scientific Computing 1
%Do at home exercises
%Sandeep Lanka
% Tue 12/5, 1:14PM
%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'timings.m'" in the Command Window. 
%To open the file type "open 'timings'" and provide the inputs making sure...
%Matlab's present directory is changed to the 'timings' directory

%The answers are different for integers and non integers.
%but the default tyype in MATLAB is a double which shows no difference
function [outputs] = timings(A,B)
format long
outputs = zeros(1,5);
%Addition
tic
C = A + B;
outputs(1,1) = toc;
fprintf('time of execution of Addition is %d \n\n',toc);

%Subtraction
tic
D = A - B;
outputs(1,2) = toc;
fprintf('time of execution of Subtraction is %d \n\n',toc);

%Multiplication
tic
E = A * B;
outputs(1,3) = toc;
fprintf('time of execution of Multiplication is %d \n\n',toc);

%Division
tic
F = A / B;
outputs(1,4) = toc;
fprintf('time of execution of Dvision is %d \n\n',toc);

%exponentiation
tic
G = A ^ B;
outputs(1,5) = toc;
fprintf('time of execution of Exponentiation is %d \n\n',toc);


end