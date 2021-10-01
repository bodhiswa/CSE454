% Author: Bodhiswattwa Basu (bodhiswa)
% Date: 18th Sept, 2021 (Fall)
% Fuzzy Controller Project : 
% This project is an implementation of Fuzzy logic in MATLAB. The goal of
% the project is to move a robot from its initial position to a final
% destination position. 

% Creating the membership functions for shortest distance to destination:

syms x;                             % Creating a variable x.

% Membership function #1: 'Very Close' (VC) to the destination.

fvcr1 = 0;                           % Region 1
a = -180;                           % Lower limit
b = -20;                            % Lower support limit
c = 200;                            % Upper support limit
d = 250;                            % Upper limit
fvcr2(x)= (d-x)/(d-c);                % Region 2
%fcr3(x)= 1;                          % Region 3
pwC=piecewise(x>d,fvcr1,c<x<d,fvcr2,x<c,1);               % Plotting the piecewise function.
fplot(pwC,[0,1000]);     
hold on

% Membership function #2: 'Close' (C) to the destination.

fcr1 = 0;                           % Region 1
a = 220;                            % Lower limit
b = 300;                            % Lower support limit
c = 400;                            % Upper support limit
d = 475;                            % Upper limit
fcr2(x)= (x-a)/(b-a);               % Region 2
fcr4(x)= (d-x)/(d-c);               % Region 4
pwC1=piecewise(x<a,fcr1,a<x<b,fcr2,b<x<c,1,c<x<d, fcr4);     %Plotting the piecewise function.
fplot(pwC1,[0,1000])
hold on

% Membership function #3: 'Average' (A) distance to the destination.

far1 = 0;                           % Region 1
a = 425;                            % Lower limit
b = 500;                            % Lower support limit
c = 600;                            % Upper support limit
d = 675;                            % Upper limit
far2(x)= (x-a)/(b-a);               % Region 2
far4(x)= (d-x)/(d-c);               % Region 4
pwC2=piecewise(x<a,far1,a<x<b,far2,b<x<c,1,c<x<d, far4);     %Plotting the piecewise function.
fplot(pwC2,[0,1000])
hold on

% Membership function #4: 'Far' (F) from the destination.

ffr1 = 0;                           % Region 1
a = 625;                            % Lower limit
b = 700;                            % Lower support limit
c = 800;                            % Upper support limit
d = 875;                            % Upper limit
ffr2(x)= (x-a)/(b-a);               % Region 2
ffr4(x)= (d-x)/(d-c);               % Region 4
pwC2=piecewise(x<a,ffr1,a<x<b,ffr2,b<x<c,1,c<x<d, ffr4);     %Plotting the piecewise function.
fplot(pwC2,[0,1000])
hold on

% Membership function #5: 'Very Far' (VF) distance to the destination.

fvfr1=0;                             % Region 1
a = 850;                            % Lower limit
b = 900;                            % Lower support limit
c = 1000;                           % Upper support limit
d = 1050;                           % Upper limit
fvfr2(x)= (x-a)/(b-a);               % Region 2
pwC4=piecewise(x<a,fvfr1,a<x<b,fvfr2,x>b,1);
fplot(pwC4,[0,1000])
hold on

% Fuzzification process: 

x_coord = input("Enter the x-coordinates of the destination: ");            % User input of x-coordinates 
y_coord = input("Enter the y-coordinates of the destination: ");            % User input of y-coordinates
sd = sqrt((x_coord^2)+(y_coord^2));                                         % Shortest distance to destination calculation
x = sym(sd);                                                                % sd becomes a symbolic variable of x

hold off

% Rule strengthening for W1
f1_vc = double(fvcr2(x));                               % Converting function value to double.         
%f2_vc = double(fvcr3(x));                               % Converting function value to double.
fvcmin = min([f1_vc 1]);                            % Finding the rule firing strength. 
f_vcmember = max([fvcmin    0]);                        % Lukasiewicz norm.

% Rule strengthening for W2
f1_c = double(fcr2(x));                               % Converting function value to double.         
f2_c = double(fcr4(x));                               % Converting function value to double.
fcmin = min([f1_c f2_c]);                            % Finding the rule firing strength. 
f_cmember = max([fcmin    0]);                        % Lukasiewicz norm.

% Rule strengthening for W3
f1_a = double(far2(x));                               % Converting function value to double.         
f2_a = double(far4(x));                               % Converting function value to double.
famin = min([f1_a f2_a]);                            % Finding the rule firing strength. 
f_amember = max([famin    0]);                        % Lukasiewicz norm.

% Rule strengthening for W4
f1_f = double(ffr2(x));                               % Converting function value to double.         
f2_f = double(ffr4(x));                               % Converting function value to double.
ffmin = min([f1_f f2_f]);                            % Finding the rule firing strength. 
f_fmember = max([ffmin    0]);                        % Lukasiewicz norm.

% Rule strengthening for W5
f1_vf = double(fvfr2(x));                               % Converting function value to double.         
fvfmin = min([f1_vf 1]);                            % Finding the rule firing strength. 
f_vfmember = max([fvfmin    0]);                        % Lukasiewicz norm.

% A goal of the robot: Speed to travel at ...
speed_vs = 5;                                    % Very slow speed = 5.0 m/s
speed_s = 6.5;                                   % Slow speed = 6.5 m/s
speed_a = 8;                                     % Average speed = 8.0 m/s
speed_f = 9.5;                                   % Fast speed = 9.5 m/s
speed_vf = 12;                                   % Very fast speed = 12.0 m/s
speed_output = (speed_vs*f_vcmember + speed_s*f_cmember + speed_a*f_amember + speed_f*f_fmember +speed_vf*f_vfmember)/(f_vcmember+f_cmember+f_amember+f_fmember+f_vfmember);            % Output speed based on membership.

% Forward force required by the robot: Assuming that the mass of the robot
% is 2 kgs.
forward_force_output = (speed_vs*2*f_vcmember + speed_s*2*f_cmember + speed_a*2*f_amember + speed_f*2*f_fmember +speed_vf*2*f_vfmember)/(f_vcmember+f_cmember+f_amember+f_fmember+f_vfmember);            % Output forward force based on membership.
update_output = round(sd/100);

% Conditional statements to go with fuzzified inputs for output display. 
if(update_output > 10)
    disp("Coordinates are too large, please run program again and re-enter coordinates.")               % Error message if coordinates are too large.
else
    %Loops for outputing based on 100m checkpoint (first 100 m checkpoint)
    for disp_time = 1
        disp("These are the starting coordinates == (0,0)");
        if sd < 250
            weight = "Very Close to the destination";
        end
        if sd > 225 && sd < 475
            weight = "Close to the destination";
        end
        if sd > 475 && sd < 675
            weight = "Average distance from the destination";
        end
        if sd > 525 && sd < 875
            weight = "Far from the destination";
        end
        if sd > 875 && sd < 1050
            weight = "Very Far from the destination";
        end
        weight_func = ['Weight of the membership function: ', weight];
        disp(weight_func);
        fprintf('Speed of the robot: %f m/s \n', speed_output);             % print functions for speed output
        fprintf('Forward Force: %f N \n', forward_force_output);             % print functions for forward force output
        disp("-----------------------------------------------------------------------");
    end
    %Loops for outputing based on 100m checkpoint (next 100 m checkpoints)
    for disp_time = 2:(update_output)
        time_func = ["100m Checkpoint Number ", (disp_time-1)];
        disp(time_func);
        new_dist = sd - 100;
        if new_dist < 250
            weight = "Very Close to the destination";
        end
        if new_dist > 225 && new_dist < 475
            weight = "Close to the destination";
        end
        if new_dist > 475 && new_dist < 675
            weight = "Average distance from the destination";
        end
        if new_dist > 525 && new_dist < 875
            weight = "Far from the destination";
        end
        if new_dist > 875 && new_dist < 1050
            weight = "Very Far from the destination";
        end
        weight_func = ['Weight of the membership function: ', weight];
        disp(weight_func);
        fprintf('Speed of the robot: %f m/s \n', speed_output);
        fprintf('Forward Force: %f N \n', forward_force_output);
        disp("-----------------------------------------------------------------------");
    end
    %Loops for outputing based on 100m checkpoint (last 100 m checkpoint)
    for disp_time = update_output
        weight_func = ['Weight of the membership function: ', weight];
        disp(weight_func);
        fprintf('Speed of the robot: %f m/s \n', speed_output);
        fprintf('Forward Force: %f N \n', forward_force_output);
        fprintf("The destination (%f, %f) is reached!", x_coord, y_coord);
    end
end