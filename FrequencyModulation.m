%% Freq Spectrum 

clear all;
close all;
t = [0:1:1000];
fs = 10000;
fc = 500;
fm = 20;
figure;
d = 5*cos(2*pi*fm*t/fs);
subplot(4,1,1); plot(t,d);
title("Message");
xlabel('Time')
ylabel('Amplitude')
c = 10* cos(2*pi*fc*t/fs);
mod_sig = fmmod(d, fc, fs, 40);
subplot(412);
plot(t,mod_sig);
title("Modulated");
xlabel('Time')
ylabel('Amplitude')
demod_sig = fmdemod(mod_sig, fc, fs, 40);
subplot(4,1,3);
plot(t, demod_sig);
title("Demodulated");
xlabel('Time')
ylabel('Amplitude')


n = length(mod_sig);
X = fft(mod_sig);
f = (0:n-1)*(fs/n);     %frequency range
power = abs(X).^2/n;    %power

subplot(414); Y = fftshift(X);
fshift = (-n/2:n/2-1)*(fs/n);
powershift = abs(Y).^2/n;     
plot(fshift,powershift)
xlabel('Frequency')
ylabel('Power Amplitude')
title('Frequency Spectrum')
