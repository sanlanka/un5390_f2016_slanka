function apollo_mission
% Initialization
% G = 6.67428e-11; % universal constant of gravitation
G = 6.63e-11;
% Me = 5.9736e24; % mass of earth
Me = 6e24;
% Mm = 7.3477e22; % mass of moon
Mm = 7.2000e+22;
Ms = 15000; % mass of satellite
Re = 6378.14e03; % radius of earth
Rm = 1737.10e03; % radius of moon

% rs = Re + 185000; % radius of parking orbit
rs = -6400e03;
d = 3843.03e05; % distance between the earth and the moon
% D = Re+d+Rm; % distance between the centers
D = 4e8;
T = 27.3216; % period of revolution of moon
h = 300; % suggested time step

Ipos_earth = [0 0]; % Earth's position
Ipos_moon = [D 0]; % Moon's initial position
Ipos_satellite = [rs 0]; % Satellite's initial position

COM = (Mm*Ipos_moon + Me*Ipos_earth)/(Mm + Me); % Center of mass

% w_moon = 2*pi/(T*24*60*60); % angular velocity of the moon
w_moon = sqrt((G*(Mm + Me))/D^3);
w_satellite = sqrt((G*(Ms + Me))/(abs(Ipos_satellite(1)))^3); % angular velocity of the satellite

Rpos_earth = Ipos_earth - COM; % relative position of earth WRT COM
Rpos_moon = Ipos_moon - COM; % relative position of moon WRT COM
Rpos_satellite = Ipos_satellite - COM; % relative position of satellite WRT COM

RRe = sqrt(sum(Rpos_earth.^2)); % relative radius of earth WRT COM
RRm = sqrt(sum(Rpos_moon.^2)); % relative radius of moon WRT COM

v_earth = [0 0]; % initial velocity of earth
% v_satellite = [w_satellite*Ipos_satellite(1) 0]; % initial velocity of satellite
v_satellite = [-9000 0];
v_moon = [0 w_moon*RRm]; % initial velocity of moon

Y = [Rpos_moon';v_moon';Rpos_earth';v_earth';Rpos_satellite';v_satellite'];

t = 0;
n = 1660; % number of time steps
sat_launch = h*12; % Time when apollo detaches from service module
sat_trans_moon = h*100; % Time when Apollo thrusts toward moon
sat_lunar_orbit = h*(896); % Time when Apollo brakes into moon orbit
sat_trans_earth = h*(985-81); % Time when Apollo thrusts toward Earth
f = 0;
for i = 1:n
    if (h*i == sat_launch)
        Y(11) = 0;
        Y(12)= -4500;
    end
    if (h*i == sat_trans_moon)
        Y(11)= Y(11) + 1450;
        Y(12)= Y(12) - 1750;
    end
    if (h*i == sat_lunar_orbit)
        dsm = norm(Rpos_satellite - Rpos_moon);
        wsm = sqrt((G*(Ms + Mm))/dsm^3);
        
        Y(11) = wsm*dsm;
        Y(12) = wsm*dsm;
    end
    if (h*i == sat_trans_earth)
        Y(11) = Y(11) + 600;
        Y(12) = Y(12) - 550;
    end    
    % Runge-Kutta
    f1 = sat_pos(t, Y);
    f2 = sat_pos(t+h/2, Y+f1*(h/2));
    f3 = sat_pos(t+h/2, Y+f2*(h/2));
    f4 = sat_pos(t+h, Y+f3*h);
    Y = Y + (f1 + f2*2 + f3*2 + f4) * (h/6);
    %Plot
    if mod(i,10)==0
        plot(Y(1), Y(2),'ko','MarkerSize', 5) % plot moon
        hold on
        plot(Y(5), Y(6), 'ko','MarkerSize', 10) % plot earth
        hold on
        plot(Y(9), Y(10), 'k.', 'Markersize', 5) % plot satellite
        hold on
        title('2D Trajectory')
        axis([-.1e9 .4e9 -.1e9 .4e9])
        xlabel('meters')
        ylabel('meters')
        % create image
        f=f+1;
        set(gcf, 'InvertHardCopy', 'off');
        saveas(gcf, ['Apollo2D_',sprintf('%03d',f),'.png'])
        pause(0.01)
    end
    % increment time 
    t = t+h;
end
end


function dYdt = sat_pos(t, Y)
% G = 6.67428e-11; % universal constant of gravitation
G = 6.63e-11;
% Me = 5.9736e24; % mass of earth
Me = 6e24;
% Mm = 7.3477e22; % mass of moon
Mm = 0.012*Me;
Ms = 15000; % mass of satellite

rmn = [Y(1);Y(2)];
vmn = [Y(3);Y(4)];

ren = [Y(5);Y(6)];
ven = [Y(7);Y(8)];

rsn = [Y(9);Y(10)];
vsn = [Y(11);Y(12)];

dem = sqrt((rmn(1)-ren(1))^2 + (rmn(2)-ren(2))^2);
dsm = sqrt((rsn(1)-rmn(1))^2 + (rsn(2)-rmn(2))^2);
dse = sqrt((rsn(1)-ren(1))^2 + (rsn(2)-ren(2))^2);

Fme = - Me * Mm * G / dem^3 .* (rmn-ren);
Fem = - Me * Mm * G / dem^3 .* (ren-rmn);
Fsm = - Mm * Ms * G / dsm ^3 .* (rsn-rmn);
Fse = - Me * Ms * G / dse ^3 .* (rsn-ren);

am = Fme/Mm;
ae =  Fem/Me;
as = ((Fse+Fsm)/Ms);

dYdt = [vmn; am; ven; ae; vsn; as];   
end