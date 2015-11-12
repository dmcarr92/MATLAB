
function [] = assignment5(in)

%------------- Stage 1 --------------%
if(in == 1)
    VGS(1,:) = [.5 .1 .01 .6 .58 .9 .87];
    VGS(2,:) = [.6 .7 .1 .67 .59 .7 .07];
    VGS(3,:) = [.2 1.0 .31 .6 .71 .9 .17];
else
    VGS(1,:) = [.51 .1 .25 .6 .65 .9 .87];
    VGS(2,:) = [.5 .61 .1 .06 .53 .9 .01];
    VGS(3,:) = [.7 .59 .02 .31 .82 .9 .22];
    VGS(4,:) = [.15 .5 .29 .6 .75 .9 .32];
end

row = size(VGS,1);
col = size(VGS,2);
Vt = 0.40;
subplot(6,1,1); bar(VGS); grid on;
title('VGS'); xlabel('Case'); ylabel('Volts');

%------------- Stage 2 --------------%
for i = 1:row
    for j = 1:col
        if(VGS(i,j) > Vt)
            VGS(i,j) = 1;
        else
            VGS(i,j) = 0;
        end
    end
end

subplot(6,1,2); bar(VGS); grid on;
title('VGS Binary'); xlabel('Case'); ylabel('On/Off');

%------------- Stage 3 --------------%
key = [0 1 1 0 0 1 0];
for i = 1:row
    encrypted_msg(i,:) = xor(VGS(i,:),key);
end
subplot(6,1,3); bar(encrypted_msg); grid on;
title('Encryption');

%------------- Stage 4 --------------%
time=[];
ASK_signal = [];
Digital_signal = [];
fs = 100;
t = 0:1/fs:1;
Amp0 = 3; 
Amp1 = 10;
for i = 1:row
    for j = 1:col

    ASK_signal = [ASK_signal (encrypted_msg(i,j)==0)*Amp0*sin(2*pi*t)+(encrypted_msg(i,j)==1)*Amp1*sin(2*pi*t)];
    time = [time t];
    t =  t + 1;
    end
end

%------------- Stage 5 --------------%
ASK_signal_noise = ASK_signal + 2.*rand(size(ASK_signal)); 

subplot(6,1,4); plot(time,ASK_signal,'LineWidth',2); axis tight;
title('ASK Modulation'); xlabel('Time'); ylabel('Amp');
subplot(6,1,5); plot(time,ASK_signal_noise,'LineWidth',2); axis tight;
title('ASK Modulation w/ Noise'); xlabel('Time'); ylabel('Amp');

%------------- Stage 6 --------------%
count = 26;
for i = 1:row
    for j = 1:col
        if(ASK_signal_noise(count) > 6.5)
            demod_msg(i,j) = 1;    
        end
        if(ASK_signal_noise(count) <= 6.5)
            demod_msg(i,j) = 0;
        end
        count = count + 101;
    end
end

%------------- Stage 7 --------------%
for i = 1:row
    decrypted_msg(i,:) = xor(demod_msg(i,:), key);
end

subplot(6,1,6); bar(decrypted_msg); grid on;
title('Decryption');

%------------- Stage 8 --------------%
for i = 1:row
    final_message(i) = zeros;
    for j = 1:col
        final_message(i) = decrypted_msg(i,(col-j+1))*2^(j-1) + final_message(i);
    end
end

display_msg = ['The power in Nikolai Tesla`s House is: ' char(final_message) ];
disp(display_msg);
end






