
%pi_sr.m 
%Program to calculate the approximation of Pi using Ramananjan's Pi...
%Approximation

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'pi_sr.m'" in the Command Window. 
%To open the file type "open 'pi_sr.m'" making sure...
%Matlab's present dorectory is changed to the 'pi_sr.m' directory
%To Show all the decimal degits without ROunding Off..
%type 'long form' in the command window before runing the Program else..
%Matlab will round the result to 4 decimal digits.

%slanka for SC1 Assignment_01
%Tue, 11:08PM, 09/06/2016

 
%Begin
n = 0; % Number of Summations Change this to vary the number of Summations

piapproxinv=0; %Initialising piapprox variable to zero for calculation
knownpi = 3.141592653589793; %Given value teken to be true


for i= 0:n %Summing n times 
    numerator = factorial(4*i)*(1103+26390*i); %Numerator of the 
    denominator = (((factorial(i))^4)*(396^(4*i)));
    constnt = (2*2^(1/2))/9801; % Constant 
    piiter = constnt*(numerator/denominator);%Pi value calulated for each i 
    piapproxinv = piapproxinv+piiter;
    if i==n %When th loop is complete display the Results.
        pi_s = 1/piapproxinv;
        fprintf('Value of Pi for %d Summations = %d\n\n',n,pi_s);
        %Print Value of Pi for n Summations on the Screen
    end
end
%Calculation of the Error in Approximation
error = abs(knownpi - pi_s); % Modulus of the error
fprintf('error = %d',error); %Display error on the screen
diary 'error.txt'  %Keeping the values in error.txt for the record

%End 

