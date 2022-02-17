close all;
t = [1:1:10000];
Am = 6;
Ac = 12;
fs = 1000000;%1e6
fc = 10000; %10KHz
fm = 1000; %1KHz

% Message Signal
subplot(4,1,1); plot(t, Am*cos(2*pi*fm/fs*t));
title("Message Signal");
xlabel('Time');
ylabel('Amplitude');

%Carrier Signal
subplot(4,1,2); plot(t, Ac*cos(2*pi*fc/fs*t));
title("Carrier Signal");
xlabel('Time');
ylabel('Amplitude');

% Modulated Full Carrier
mod = cos(2*pi*fm/fs*t) .* cos(2*pi*fc/fs*t);
mod = mod*Am;
fcmod = mod + Ac*cos(2*pi*fc/fs*t);
subplot(4,1,3); plot(t,fcmod);
title("Modulated FC");
xlabel('Time');
ylabel('Amplitude');

% Demodulation using filters
[b, a] = butter(3,0.01);
coh = fcmod.*cos(2*pi*fc/fs*t); %local oscillator freq
demod= filter(b,a,coh);
subplot(4,1,4);
plot(t,demod);
title("Demodulated Signal");

% Frequency Spectrum
figure;
n = length(mod);
X = fft(mod);
f = (0:n-1)*(fs/n);     %frequency range
power = abs(X).^2/n;    %power
subplot(211);
plot(f,power);

%Centering at zero
subplot(212); Y = fftshift(X);
fshift = (-n/2:n/2-1)*(fs/n); % Zero Centered Frequency Range
powershift = abs(Y).^2/n;     % Zero Centered Power
plot(fshift,powershift)
title('AM Frequency Spectrum');
ylabel('Power Magnitude')
xlabel('Frequency')
