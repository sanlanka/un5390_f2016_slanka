%compute_distance.m
%Program to calculate Distance 
%compute distance
%Execution:
%To Run Open in Matlab and Click the Run Icon or 
%type "run 'compute_distance.m'" in the Command Window. 
%To open the file type "open 'compute_distance.m'" making sure...
%Matlab's present directory is changed to the 'machine_epsilon.m' directory

%slanka for SC1 Assignment_04
%Sat, 10:30PM, 09/10/2016

%Begin
function compute_distance
%Given Coordinates
A = [deg2rad(47.1195) deg2rad(-88.5470)];
B = [deg2rad(47.4688) deg2rad(-87.8884)];
C = [deg2rad(47.119509) deg2rad(-88.5470)];

%Calling distance_slc function on all three distances
ds1 = distance_slc(A(1),A(2),B(1),B(2));
ds2 = distance_slc(B(1),B(2),C(1),C(2));
ds3 = distance_slc(A(1),A(2),C(1),C(2));

%Calling distance_haversine function on all three distances
dh1 = distance_haversine(A(1),A(2),B(1),B(2));
dh2 = distance_haversine(B(1),B(2),C(1),C(2));
dh3 = distance_haversine(A(1),A(2),C(1),C(2));

fprintf('\nDistance by SLC method:\n ');
fprintf('\nDistance AB = %d \n',ds1);
fprintf('\nDistance BC = %d \n',ds2);
fprintf('\nDistance CA = %d \n\n',ds3);


fprintf('\nDistance by Haversine method:\n');
fprintf('\nDistance AB = %d \n',dh1);
fprintf('\nDistance BC = %d \n',dh2);
fprintf('\nDistance CA = %d \n',dh3);
end
%End of Global function

%Function to calculate distance by SLC
function [dslc] =  distance_slc(theta1,phi1,theta2,phi2)
dp = abs(phi1-phi2); %delta phi
%Distance using the Spherical law cosines
dslc = ((acos(sin(theta1)*sin(theta2) ...
    + cos(theta1)*cos(theta2)*cos(dp)))*60*1.1515)*(rad2deg(1));

end
%end function

%Function to calculate distance by Haversine method
function [dhf] =  distance_haversine(t1,p1,t2,p2)
Re = 3960; %radius of the earth
dt = abs(t1-t2); %delta theta
dp = abs(p1-p2); %delta phi
a = sqrt((sin(dt/2)^2) + (cos(t1)*cos(t2)*(sin(dp/2)^2)));
b = sqrt(1-((sin(dt/2)^2)) +(cos(t1)*cos(t2)*(sin(dp/2)^2)));
%Distance using Haversine technique
dhf = 2 * Re * atan2(a,b);
end
%End function

%End












