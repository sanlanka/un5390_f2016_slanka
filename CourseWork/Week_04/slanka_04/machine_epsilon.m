%machine_epsilon.m
%Program to calculate Problem 2 
%Machine Epsilon

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'machine_epsilon.m'" in the Command Window. 
%To open the file type "open 'machine_epsilon.m'" making sure...
%Matlab's present directory is changed to the 'machine_epsilon.m' directory

%slanka for SC1 Assignment_04
%Wed, 7:59PM, 09/27/2016

%Begin
single a; 
int64 n; %number of iterations
a = 1; 
n = 0;
while 1 < (1 + a) %Loop opens
    a = a/2;
    b(n+1) = a;
    n = n+1; %Increment n
end
b = b(1:52);
a = a*2; %Since its a while loop divide a by 2
n = n-1;
%Print the values of the Machine Epsilon
fprintf('\n Machine epsilon calculated :%d\n',a);
fprintf('\n Number of Iterations calculated :%d\n',n);

%Number of iterations Array
n = linspace(1,n,n);

dlmwrite('machine_epsilon.dat',[n' b'],' ');% Write data to a .dat file

%Print the Machine epsilon calulated by MATLAB
fprintf('\n Machine epsilon from matlab function "eps":%d\n',eps);
%end