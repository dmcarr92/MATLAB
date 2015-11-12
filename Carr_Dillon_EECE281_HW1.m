%% EECE281 - Homework #1
%  Dillon Carr

Vo = 1; % the voltage of the battery is 1V, meaning that as t approaches
        % infinity, the charging voltage across the capacitor should 
        % approach 1V

t  = [0:0.1:25]; % matrix of time values ranging from 0-25 sec in
                 % increments of 0.1 sec

% below is the resistance of the circuit
R  = 1e6;

% below, each capacitor's max capacitance is defined
C1 = 15e-6;
C2 = 5e-6;
C3 = 800e-9;
C4 = 100e-9;

% here, each capacitor's CHARGING voltage is defined at any value of t
V_C1_charging = Vo * (1 - exp(-t./(R*C1)));
V_C2_charging = Vo * (1 - exp(-t./(R*C2)));
V_C3_charging = Vo * (1 - exp(-t./(R*C3)));
V_C4_charging = Vo * (1 - exp(-t./(R*C4)));

% here, each capacitor's DISCHARGING voltage is defined at any value of t
V_C1_discharging = Vo * exp(-t./(R*C1));
V_C2_discharging = Vo * exp(-t./(R*C2));
V_C3_discharging = Vo * exp(-t./(R*C3));
V_C4_discharging = Vo * exp(-t./(R*C4));

% I created a 2 x 2 subplot, each quadrant of which displays the charging
% and discharging curves of its respective capacitor

% Capacitor 1
subplot(2,2,1), plot(t,V_C1_charging, t,V_C1_discharging);
axis([0 25 0 1.1]);
set(gca,'XTick',0:5:25);
xlabel('Time(sec)');
ylabel('Voltage(V)');
title('Capacitor 1');

% Capacitor 2
subplot(2,2,2), plot(t,V_C2_charging, t,V_C2_discharging);
axis([0 25 0 1.1]);
set(gca,'XTick',0:5:25);
xlabel('Time(sec)');
ylabel('Voltage(V)');
title('Capacitor 2');

% Capacitor 3
subplot(2,2,3), plot(t,V_C3_charging, t,V_C3_discharging);
axis([0 4 0 1.1]);
set(gca,'XTick',0:1:4);
xlabel('Time(sec)');
ylabel('Voltage(V)');
title('Capacitor 3');

% Capacitor 4
subplot(2,2,4), plot(t,V_C4_charging, t,V_C4_discharging);
axis([0 1 0 1.1]);
set(gca,'XTick',0:0.5:1);
xlabel('Time(sec)');
ylabel('Voltage(V)');
title('Capacitor 4');

% the blue lines are the charging curves, while the green are the
% discharging curves
