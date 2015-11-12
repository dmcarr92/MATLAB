% I-V characteristics of MOSFET 

% Vgs < Vth {cutoff, subthreshold, weak-inversion mode}
    % no current
% Vgs > Vth {triode mode or linear region}
    % Ids = kn*(2(Vgs-Vth)Vds - Vds^2) 
% Vds >= Vgs - Vth {saturation or active mode}
    % Ids = kn*((Vgs-Vth)^2)
    
% Given parameters describing physical dimensions and threshold voltage
kn  = 1e-3;
Vth = 1.5;

% The sweep of Vds (drain-source voltage) values
Vds = 0:0.5:12; 

% Current through the transistor
Ids = zeros(8,25); 

% Gate voltage
Vgs = 1:8;

for i = 1:8
    for j = 1:25
        
        if Vgs(i) < Vth
            Ids(i,j) = 0;
            
        elseif Vgs(i) > Vth && (Vgs(i) - Vth) > Vds(j)
            Ids(i,j) = kn*(2*(Vgs(i)-Vth)*Vds(j) - Vds(j)^2);
        
        else Ids(i,j) = kn*((Vgs(i)-Vth)^2);
            
        end
    end
end

plot(Vds,Ids);
xlabel('Vds, V');
ylabel('Drain Current, A');
title('I-V Characteristics of a MOSFET');