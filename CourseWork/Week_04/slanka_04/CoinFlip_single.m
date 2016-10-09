%CoinFlip_single
%Program to calculate Fairness of a Coin 
%CoinFlip_single

%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'CoinFlip_single.m'" in the Command Window. 
%To open the file type "open 'CoinFlip_single.m'" making sure...
%Matlab's present directory is changed to the 'CoinFlip_single.m' directory

%slanka for SC1 Assignment_04
%Fri, 2:43AM, 09/30/2016

clear;
clc;
%Begin
%Probabilty of heads/tails since the coin is fair
p = 0.5; 
m = 3; %number if number of trails
%Number of trails for each p
n = 10; 
h = 0; %Number of heads when zero trails=0
for j = 1:m
for i = 1:(n^j) %Trails increase in powers of 10
     %Tossing the coin
     %some random random number generator generated on the fly
     r = round(sum(sum(rand(2,5)*rand(5,2))));
     if r > 5
            h = h+1; %Number of Heads
     end
end
ht(j) = h;
% Bernouli Distribution
%Therotical probabilty of number of heads for powers of 10.
ph(j) = nchoosek(n^j,h)*(p^h)*((1-p)^((n^j)-h));
h = 0;
end
%For a fair coin probabilty of obtaining 'h' Heads is

%Write the data to a 
dlmwrite('CoinFlip_single.dat',[ht' ph'],' ');% Write data to a .dat file
%End
