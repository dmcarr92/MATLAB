function mod_sig = carr_mod_signal(msg_freq,msg_amp,car_freq,car_amp)
  
  i = 0;
  for i = 0:1
    if msg_freq <= 0 || msg_amp <= 0 || car_freq <= 0 || car_amp <= 0
      error('All input values to mod_signals must be greater than 0.')
      break
    else
        
      %time range
      time = 0:0.0001:1; 

      msg = msg_amp*cos(2*pi*msg_freq.*time); %message wave
      carrier = cos(2*pi*car_freq.*time); %carrier wave with unit amplitude
      x = msg.*carrier; %message*carrier
      mod = x+(car_amp.*carrier); %message*carrier+carrier

      %plot
      subplot(4,1,1),plot(time,msg);
      xlabel('Time --- (sec)'); ylabel('Amplitude'); legend('Message signal m(t)'); title('Message');

      subplot(4,1,2),plot(time,carrier);
      xlabel('Time --- (sec)'); ylabel('Amplitude'); legend('Carrier signal c(t)'); title('Carrier');

      subplot(4,1,3),plot(time,mod);
      xlabel('Time --- (sec)'); ylabel('Amplitude'); legend('Amplitude modulated signal s(t)'); title('Mod');

      %fm signal
      b = (car_freq-msg_freq)/msg_freq;

      modfm = car_amp.*cos(2*pi*car_freq.*time + b*sin(2*pi*msg_freq.*time));
      subplot(4,1,4)
      plot(time,modfm);
      xlabel('Time --- (sec)');
      ylabel('Amplitude');
      legend('Frequency modulated signal s(t)');
      title('FM signal');
    end
  end
end

% Code modified from
% http://engineerspost.blogspot.com/2012/04/amplitude-modulation-and-frequency.html