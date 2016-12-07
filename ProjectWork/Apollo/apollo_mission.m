function apollo_mission
tic
parpool('local',8)
% Initialization
G = 6.63e-11; % universal constant of gravitation
Me = 6e24; % mass of earth
Mm = 7.2000e+22; % mass of moon
Ms = 15000; % mass of satellite
rs = 6400e03; % radius of parking orbit
D = 4e8; % distance between the earth and the moon
T = 27.3216; % period of revolution of moon
h = 300; % suggested time step

Ipos_earth = [0 0]; % Earth's position
Ipos_moon = [D 0]; % Moon's initial position
Ipos_satellite = [-rs 0]; % Satellite's initial position

COM = (Mm*Ipos_moon + Me*Ipos_earth)/(Mm + Me); % Center of mass

w_moon = sqrt((G*(Mm + Me))/D^3); % angular velocity of the moon

Rpos_earth = Ipos_earth - COM; % relative position of earth WRT COM
Rpos_moon = Ipos_moon - COM; % relative position of moon WRT COM
Rpos_satellite = Ipos_satellite - COM; % relative position of satellite WRT COM

RRm = sqrt(sum(Rpos_moon.^2)); % relative radius of moon WRT COM

v_earth = [0 0]; % initial velocity of earth
v_satellite = [-9000 0]; % initial velocity of satellite
v_moon = [0 w_moon*RRm]; % initial velocity of moon

n = 1660; % number of time steps
sat_launch = h*12; % Time when apollo detaches from service module
sat_trans_moon = h*100; % Time when Apollo thrusts toward moon
sat_lunar_orbit = h*(896); % Time when Apollo brakes into moon orbit
sat_trans_earth = h*(985-81); % Time when Apollo thrusts toward Earth
Y = [Rpos_moon';v_moon';Rpos_earth';v_earth';Rpos_satellite';v_satellite'];
dvx = 100:1:3000;
dvy = -400:-1:-3300;
YY = cell(size(dvx,2),1);
for k = 1:size(dvx,2)
    YY{k,1} = Y;
end
parfor j = 1:size(dvx,2)
    t = 0;
    Y = [Rpos_moon';v_moon';Rpos_earth';v_earth';Rpos_satellite';v_satellite'];
    for i = 1:n
        if (h*i == sat_launch)
            Y(11) = 0;
            Y(12)= -4500;
        end
        if (h*i == sat_trans_moon)
            Y(11)= Y(11) + dvx(j);
            Y(12)= Y(12) + dvy(j);
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
        % Runge-Kutta method
        f1 = sat_pos(t, Y);
        f2 = sat_pos(t+h/2, Y+f1*(h/2));
        f3 = sat_pos(t+h/2, Y+f2*(h/2));
        f4 = sat_pos(t+h, Y+f3*h);
        Y = Y + (f1 + f2*2 + f3*2 + f4) * (h/6);
        YY{j,1} = [YY{j,1} Y];
        t = t+h;
    end
end

%%
for p = 1:size(YY,1)
    if ((sqrt((YY{p,1}(9,end) - YY{p,1}(5,end))^2 + (YY{p,1}(10,end)-YY{p,1}(6,end))^2) < 1.4e07))
        if (sqrt((YY{p,1}(9,906) - YY{p,1}(1,906))^2 + (YY{p,1}(10,906)-YY{p,1}(2,round(906)))^2) < 2.7e06)
            index = p;
            disp(index)
        end
    end
end
%% Animation
f = 0;
Image = cell(n/10,1); % Initialize image cell.
Y = YY{index};
for i = 10:10:size(Y,2)
    plot(Y(1,i), Y(2,i),'ko','MarkerSize', 5) % plot moon
    hold on
    plot(Y(5,i), Y(6,i), 'ko','MarkerSize', 10) % plot earth
    hold on
    plot(Y(9,i), Y(10,i), 'k.', 'Markersize', 5) % plot satellite
    hold on
    title('2D Trajectory')
    axis([-.1e9 .4e9 -.1e9 .4e9])
    xlabel('meters')
    ylabel('meters')
    % create image
    f=f+1;
    set(gcf, 'InvertHardCopy', 'off');
    saveas(gcf, 'Apollo2D.png')
    pause(0.01)
    pngFileName = strcat('Apollo2D.png');
    Image{f} = imread(pngFileName); % Write image to I matrix.
end

% save data to dat file
filename = sprintf('Positions_and_velocities.dat');
dlmwrite(filename,Y); % Write the values in YY to the file.

% Create movie
% Create videowriter with 1 frame per second
writerObj = VideoWriter('Apollo_mission.avi');
writerObj.FrameRate = 1;
% set the seconds per image
secsPerImage = ones(1,n/10);
% open the video writer
open(writerObj);
% write the frames to the video

for i = 1:(n/10)
    % convert the image to a frame
    frame = im2frame(Image{i});
    for j = 1:secsPerImage(i) 
        writeVideo(writerObj, frame);
    end
end
% close the writer object
close(writerObj);



toc
end


function dYdt = sat_pos(t, Y)
G = 6.63e-11;
Me = 6e24;
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
