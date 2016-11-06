%vo2max.m
%Program to predict the time based on Vo2Max and Distance
%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'vo2max.m'" in the Command Window. 
%To open the file type "open 'vo2max.m'" making sure...
%Matlab's present directory is changed to the 'vo2max.m' directory

%%ENTER the the Hours Part, Minutes part and Seconds Part when Prompted
%and ENTER distance in miles when prompted
%slanka for SC1 Assignment_07
%Sat, 12:30PM, 10/30/2016


%VO2Max x Drop dead = Oxygen cost
%%VO2Max x Drop dead - Oxygen cost = 0; For the time of the Vo2max
%Using the above equation Solving for t
%This Program is accurate upto to 0.06 millisecs. 
%For further accuracy t variable can be varied accordingly


%#Begin
clear;
clc;

%% Variables
miles = input('Enter Distance in Miles:');
vo2maxcltd = input('Enter Vo2Max:');
%% Uncomment this section in order to calculate vo2Max from Times
% thours = input('Enter Hours part of the Race completion time:');
% tmins = input('Enter Minutes part of the Race completion time:');
% tsecs = input('Enter Seconds part of the Race completion time:');
% tgiven = thours*60+tmins + (tsecs/60);
%%
S = miles*1600; %Distance in metres
t=0.001; %Accuracy = 0.001*60 = 0.06 secs or 6 centiSecs
num = (0.000104*((S/t)^2)) +  (0.182258*(S/t)) - 4.60;
    den = 0.2989558*exp(-0.1932605*t)+ 0.1894393*exp(-0.012778*t)+ 0.80;
    D = num/den;
    
%% %%Uncomment this section in order to calcuate vo2max from times
% n = (0.000104*((S/tgiven)^2)) +  (0.182258*(S/tgiven)) - 4.60;
%     d = 0.2989558*exp(-0.1932605*tgiven)+ 0.1894393*exp(-0.012778*tgiven)+ 0.80;
%     vo2maxcltd = n/d; %Calculated Vo2max
%% Solving for t
%Starting the Loop with time = 0.001 = 6 millisecs
while ((vo2maxcltd*den)<=num)
    num = (0.000104*(S/t)^2) +  0.182258*(S/t) - 4.60;
    den = 0.2989558*exp(-0.1932605*t)+ 0.1894393*exp(-0.012778*t)+ 0.80;
    t = t + 0.001;
end
%% Formatting in Hours:Minutes:Seconds Format
Hours = fix(t/60);
Minutes = fix(mod(t,60));
Seconds = fix((mod(t,60)-Minutes)*60);
fprintf('\nResults:-\nFor a distance of %f Miles,\n',miles);
fprintf('Vo2max is calculated to be = %f mL/kg/min\n',vo2maxcltd);
fprintf('For the same Vo2max and distance, \nPredicted Time is: %02d:%02d:%02d \n',Hours,Minutes,Seconds);

%#End