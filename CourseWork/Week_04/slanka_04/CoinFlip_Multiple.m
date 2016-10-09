%CoinFlip_single
%Program to calculate Fairness of a Coin 
%CoinFlip_single

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'CoinFlip_single.m'" in the Command Window. 
%To open the file type "open 'CoinFlip_single.m'" making sure...
%Matlab's present directory is changed to the 'CoinFlip_single.m' directory

%slanka for SC1 Assignment_04
%Sat, 3:16PM, 10/1/2016

clear;
clc;
%Begin
%Probabilty of heads/tails since the coin is fair
%Number of trails for each p
n = 10; 
h = 0; %Number of heads when zero trails=0

%%%%%
j=1;
for p = 0:0.1:1
 for i=1:100
     
     ht(i,j) = binornd(n,p)+rand();
     h = 0;
 end
 j = j +1;
end
%For a fair coin probabilty of obtaining 'h' Heads is
pv = linspace(0,1,11);
%Write the data to a 
dlmwrite('CoinFlip_Multiple.dat',[pv', ht'],' ');% Write data to a .dat file

%End
