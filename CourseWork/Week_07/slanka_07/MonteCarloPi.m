%MonteCarloPi
%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'MonteCarloPi'" in the Command Window. 
%To open the file type "open 'MonteCarloPi'" making sure...
%Matlab's present directory is changed to the 'MonteCarloPi' directory

%slanka for SC1 Assignment_07
%Thu, 10:32PM, 10/11/2016

%Begin
%Assuming the Area of the Circle to be =1;
%Also assuming the coordinates of the origin to be (0,5,0.5)
%% Set the Number of random points
%The more number of points
n=input('Enter the Number of Points: ');
for k = 1:9
rep = n^k; 
%Generate the Random x Coordinates
x=rand(rep,1);
%Generate the random y coordinates
y=rand(rep,1);

%% Plot the figure
%figure();
%hold all 
%axis square;
x1=x-0.5;
y1=y-0.5; %cirle has centre at (0.5,0.5)
r=x1.^2+y1.^2; %Area of the cartesian Circle
dartsinside=0;   %Number of points inside circle
for i=1:rep
    %Area of the Circle with radius = 0.5
    if r(i)<=0.25 
        dartsinside=dartsinside+1;
        %plot(x(i),y(i),'b.');
    else

        %plot(x(i),y(i),'r.');
    end
end
%% Pi value approximation
pi(k) = dartsinside/(0.25*rep);
Plo(k) = rep ;
end
Error = pi - 3.141592653589793;
Powers = linspace(1,9,9);
format short
Errordat = [Powers' abs(Error)'];
Pidat = [Powers' pi'];
dlmwrite('Error.dat',Errordat,' ');
dlmwrite('pi.dat',Pidat,' ');
disp('Pi values for Different Number of points:');
format long;
disp(pi');
