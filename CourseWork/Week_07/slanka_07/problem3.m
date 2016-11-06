%problem3.m
%Program to represnt the relationship of Temperature with respect to time
%..under a certain surrounding temperature.
%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'problem3.m'" in the Command Window. 
%To open the file type "open 'problem3.m'" making sure...
%Matlab's present directory is changed to the 'problem3.m' directory

%slanka for SC1 Assignment_07
%Mon, 11:28PM, 10/31/2016
% 
% Troom = 70; %Room temperature/Surrounding Temperature
% % alpha = k*(1-deltime);
% beta = k*deltime*Troom;

%begin
%% Calculation of the constant k ..
%using the vectots tl and Tl where
% tl = [0 5 10 15 20 25 30 45 60 75 90 120];
% Tl = [200 182 169 159 151 144 137 123 113 106 100 91];
clear; close all; clc;
k1 = 1/5*((182-200)/(70-200));
k2 = 1/5*((169-182)/(70-182));
k3 = 1/5*((159-169)/(70-169));
k4 = 1/5*((159-159)/(70-159));
k5 = 1/5*((144-151)/(70-151));
k6 = 1/5*((137-144)/(70-144));
k7 = 1/5*((123-137)/(70-137));
k8 = 1/5*((113-123)/(70-123));
k9 = 1/5*((106-113)/(70-113));
k10 = 1/5*((100-106)/(70-106));
k11 = 1/5*((91-100)/(70-100));
k = (k1 + k2 + k3 + k4 + k5 + k6 + k7 + k8 + k9)/9;
T(1) = 200; %Intial Temperature of the Liquid
error = 1;%Difference betwwen each iteration
TOL = 0.1;%Tolerence
t = 0;%Initial Simulation time
dt = 1; %Time Step (Min)
Troom = 70;%Room Temperature
alpha = 1- (k*dt);%  alpha = k*(1-deltime);
beta = k*dt*Troom;% beta = k*deltime*Troom;
%% Loop to find the Temperature that doesn't change by 0.1F
%The loop breaks when the Error is less than or equal 0.1
while (error > TOL)
   t = t+dt; %Increment time, dt can be varied for different time steps
   T(t+1) = (alpha*T(t))+beta; 
    error = abs(T(t+1)-T(t));%Error Calculation
end
%% Plot the Results
plot(T),hold on
xlabel('Time'),ylabel('Temperature'),
[r,c] = size(T);
tt = linspace(1,dt*(t+1),(t+1));
dlmwrite('T.dat',[tt' T'],' ');
fprintf('Final Temperature = %f degrees F at time = %d mins\n',T(1,c),tt(1,c));
%end
