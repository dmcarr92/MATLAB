clc
clear all

% generate sum of sinusoid signals
% define parameters
f = 0.5e3;          % f  = fundamental frequency of 1st sinewave
N = 160;            % N  = number of samples
W = 40;             % W  = number of samples per cycle
fs = 2*f*W;         % fs = sampling frequency
t = [0:N-1]*1/(fs); % t  = time samples

% generate the sinewaves 
a1 = sin(2*pi*f*t);         % sinewave with freq = f,  A=1
a3 = (1/3)*sin(2*pi*3*f*t); % sinewave with freq = 3f, A=1/3
a5 = (1/5)*sin(2*pi*5*f*t); % sinewave with freq = 5f, A=1/5
a7 = (1/7)*sin(2*pi*7*f*t); % sinewave with freq = 7f, A=1/7

% plot each sinewave and then various sums
subplot(4,2,1); plot(t,a1);
subplot(4,2,3); plot(t,a3);
subplot(4,2,5); plot(t,a5);
subplot(4,2,7); plot(t,a7);
subplot(4,2,2); plot(t,a1);
subplot(4,2,4); plot(t,a1+a3);
subplot(4,2,6); plot(t,a1+a3+a5);
subplot(4,2,8); plot(t,a1+a3+a5+a7);
pause;

% take the FFT of the sum of all the sinewaves
x = a1+a3+a5+a7;                % x = sum of the sinewaves
n = pow2(nextpow2(length(t)));  % n = power of 2 greater than number of samples
y = fft(x,n);                   % n point FFT of x
f = (0:n-1)*(fs/n);             % Frequency range
power = y.*conj(y)/n;           % Power of the FFT of x
subplot(1,1,1); plot(f,power);  % Plot frequency spectrum
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf Frequency Spectrum}')
pause;

% generate a single pulse of amplitude 1 and width W,
% then apply this pulse to each of the sinewaves which are combined 
% using linearity

pulse = zeros(1,N);
i = 1;
for i = 1:W
    pulse(i) = 1;
end

a1_pulse = a1.*pulse;
a3_pulse = a3.*pulse;
a5_pulse = a5.*pulse;
a7_pulse = a7.*pulse;

subplot(4,2,1); plot(t,a1_pulse);
subplot(4,2,3); plot(t,a3_pulse);
subplot(4,2,5); plot(t,a5_pulse);
subplot(4,2,7); plot(t,a7_pulse);
subplot(4,2,2); plot(t,a1_pulse);
subplot(4,2,4); plot(t,a1_pulse+a3_pulse);
subplot(4,2,6); plot(t,a1_pulse+a3_pulse+a5_pulse);
subplot(4,2,8); plot(t,a1_pulse+a3_pulse+a5_pulse+a7_pulse);
pause;

N = 800;
f = 0.5e3;
t2 = [0:N-1]*1/(fs);

% generate the sinewaves
a1 = sin(2*pi*f*t2);         % sinewave with freq = f,  A=1
a3 = (1/3)*sin(2*pi*3*f*t2); % sinewave with freq = 3f, A=1/3
a5 = (1/5)*sin(2*pi*5*f*t2); % sinewave with freq = 5f, A=1/5
a7 = (1/7)*sin(2*pi*7*f*t2); % sinewave with freq = 7f, A=1/7

subplot(4,2,1); plot(t2,a1);
subplot(4,2,3); plot(t2,a3);
subplot(4,2,5); plot(t2,a5);
subplot(4,2,7); plot(t2,a7);
subplot(4,2,2); plot(t2,a1);
subplot(4,2,4); plot(t2,a1+a3);
subplot(4,2,6); plot(t2,a1+a3+a5);
subplot(4,2,8); plot(t2,a1+a3+a5+a7);
pause;

sq_pulse = a1_pulse+a3_pulse+a5_pulse+a7_pulse;
sq_wave = a1+a3+a5+a7;

subplot(2,2,1); plot(t,sq_pulse);
xlabel('Time (s)')
ylabel('Amplitude')
title('{\bf Square Pulse}')

subplot(2,2,2); plot(t2,sq_wave);
xlabel('Time (s)')
ylabel('Amplitude')
title('{\bf Square Wave}')

n = pow2(nextpow2(length(t)));              % n = power of 2 greater than number of samples
y_pulse = fft(sq_pulse,n);                  % n point FFT of x
f_pulse = (0:n-1)*(fs/n);                   % Frequency range
power_pulse = y_pulse.*conj(y_pulse)/n;     % Power of the FFT of x
subplot(2,2,3); plot(f_pulse,power_pulse);  % Plot frequency spectrum
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf Frequency Spectrum}')

n = pow2(nextpow2(length(t2)));             % n = power of 2 greater than number of samples
y_wave = fft(sq_wave,n);                    % n point FFT of x
f_wave = (0:n-1)*(fs/n);                    % Frequency range
power_wave = y_wave.*conj(y_wave)/n;        % Power of the FFT of x
subplot(2,2,4); plot(f_wave,power_wave);    % Plot frequency spectrum
xlabel('Frequency (Hz)')
ylabel('Power')
title('{\bf Frequency Spectrum}')

