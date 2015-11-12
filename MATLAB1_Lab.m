%% Dillon Carr - WTSN 112 - MATLAB1 Lab

%% Problem 1
% Provide comments for the following program

% Set format as compact and clear all previously saved variables/data
format compact
clear all
clc

% Display the problem # and a space beneath to the user
display('Problem 01: ');
display(' ');

% Initializing the variables for drag, density, velocity and area
d = 20000;
r = 1e-7;
V = 100*0.4470;
A = 1;

% Display to the user the intention of the program, and display the values
% of the saved variables
display('In order to calculate the drag coefficient, we use the following test case:')
display(['Drag, d:     ',num2str(d)]);
display(['Density, r:  ',num2str(r)]);
display(['Velocity, V: ',num2str(V)]);
display(['Area, A:     ',num2str(A)]);
display(' ');
% When including a varible in a display command, it's useful to know that
% the syntax is:
% disp(['Insert text here ',num2str(var)]);

% Create new variable, cd, and set it equal to the formula using previously
% saved variables. Display cd to the user
cd = d*2/(r*V^2*A);
display(['The value for the coefficient of drag (cd) is: ',num2str(cd)]);
display(' ');

% Create an array, V, from 0 - 200 counting by 20s
V = 0:20:200;

% Calculate for drag using array-multiplication (.*), and create a vertical
% array by putting a ' after each set called upon
drag = cd.*r.*V.^2*A/2;
TableofVvsD = [V' ,drag'];

% Display the array just created, TableofVvsD
display('The following is a table of the velocity vs drag for the above conditions:')
display(num2str(TableofVvsD));
pause

%% Problem 2
% Create a game that allows a user 3 attempts to hit a wall with a cannonball

clear all
clc

% Generate a random distance to the wall and display this distance to the
% user
wall = randi([100,1000]);
disp(['The distance to the wall is ',num2str(wall),' meters. '])
disp('  ')

% Beginning of a for loop to allow the user 3 attempts, unless they hit the
% wall in which case the for loop terminates
for i = 1:3
% User inputs an angle and velocity of the launched cannonball
theta = input('Please enter the angle at which you will fire your cannonball. ');
disp('  ')
Vi   = input('Please enter the velocity at which you will fire your cannonball. ');
disp('  ')

% Use the user-input values to calculate all necessary components of
% trajectory
Vx    = Vi*cos((theta*pi)/180);
Vy    = Vi*sin((theta*pi)/180);
g     = 9.81;
Tmax  = 2*(Vy/g);
t     = 0:0.01:Tmax;
X     = Vx*t;
Y     = Vy*t-(g*t.^2)/2;

% Display to the user how far their cannonball went so they can improve on
% the next shot
disp(['Your rocket flew ',num2str(Vx*Tmax),' meters.'])
disp('  ')
pause

% Create plot of the cannonball's trajectory
hold on
plot(X,Y)
axis([0 1000 0 500]);
title('Cannonball Trajectory');
xlabel('Meters');
ylabel('Meters');

% If statement to output an appropriate response to the user's shot
if  abs((Vx*Tmax)-wall) <= 3
    disp('Congratulations! You hit the wall!')
    disp('  ')
    break % Break indicates that if the user hits the wall, the for loop terminates
elseif abs((Vx*Tmax)-wall) <= 10,
    disp('Your cannonball hit within 10 meters of the wall!')
    disp('  ')
else
    disp(['Your cannonball missed by over 10 meters. You have ',num2str(3-i),' attempt(s) left.'])
    disp('  ')
end
end

% Whenever the for loop terminates, this message will display
disp('Thanks for playing!')

