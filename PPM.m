%%PPM
clc;
clear all;
close all;

t = 0:1:100;
fs = 1000;
fc = 100;
fm = 20;

%Message signal
m = 0.4*cos(2*pi*fm*t/fs)+0.5;
subplot(211); plot(t, m);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');

% Carrier Signal
c = 0.25*square(2*pi*fc*t/fs) + 0.25;
subplot(212); plot(t, c);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');

% Modulation
ppmsignal = modulate(m, fc, fs, 'ppm');
figure;
subplot(311); plot(ppmsignal);
xlabel('Time');
ylabel('Amplitude');
title('PPM Signal');
axis([0 120 0 1]) % Position of Pulse will have more difference
subplot(312); plot(ppmsignal);
xlabel('Time');
ylabel('Amplitude');
title('PPM Signal');
axis([200 360 0 1]) % Position of Pulse will have less difference


% Demodulation
%Here I have multiplied by 10 to fs is because for lower fs 
%demodulated signal is distorted
ppmsignal = modulate(m, fc, 10*fs, 'ppm');
demod_signal = demod(ppmsignal, fc, 10*fs, 'ppm');
subplot(313);
plot(demod_signal);
xlabel('Time');
ylabel('Amplitude');
title('Demodulated Signal');
