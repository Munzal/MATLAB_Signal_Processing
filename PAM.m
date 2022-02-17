
close all;
clear all;

am = 5; % message amplitude
at = 10; % carrier amplitude
fm = 50; % message frequency
fc = 1000; % carrier frequency
t = 0:0.0001:0.1;

% Message Signal
y1 = am*sin(2*pi*fm*t);
subplot(411); plot(t,y1);
title("Message");
xlabel("Time");
ylabel("Amplitude");
grid on;

%carrier Signal
y2 = at*(square(2*pi*fc*t)) + at;
subplot(412); plot(t, y2);
title("Carrier");
xlabel("Time");
ylabel("Amplitude");

%PAM
y = y1.*y2;
subplot(413); plot(t,y);
title("PAM");
xlabel("Time");
ylabel("Amplitude");

% 6th order filter for Demodulation
dem = lowpass(y,20,10000);
dem1 = lowpass(dem, 20, 10000);
dem2 = lowpass(dem1,20,10000);
dem3 = lowpass(dem2, 20, 10000);
dem4 = lowpass(dem3, 20, 10000);
dem5 = lowpass(dem4,20,10000);
subplot(414); plot(t,dem5);
title("Demodulated");
xlabel("Time");
ylabel("Amplitude");
