%%PWM

close all;
clear all;
t = 0:0.001:1;
a = 20; % carrier amplitude
b = 10; % message signal
fc = 100; % carrier freq
fm = 10; % message freq

ac = a.*sawtooth(2*pi*fc*t);
am = b.*sin(2*pi*fm*t);
n = length(ac);
for i = 1:n
    if(am(i)>=ac(i))
        pwm(i) = 1;
    else
        pwm(i) = 0;
    end
end

% Message
subplot(411); plot(t, am);
axis([0 0.15 -10 10]); % smaller time interval to see wave distinctly
xlabel("Time");
ylabel("Amplitude");
title("Message signal");

% Carrier
subplot(412); plot(t,ac);
axis([0 0.15 -20 20]);
xlabel("Time");
ylabel("Amplitude");
title("Carrier Signal");

%PWM
subplot(413); plot(t,pwm);
xlabel("Time");
ylabel("Ampitude");
title("PWM signal");
axis([0 0.15 0 2]);% smaller time interval to see wave distinctly

% Demodulation
a = lowpass(pwm, 20, 10000);
a = lowpass(a, 20, 10000);
a = lowpass(a, 20, 10000);

subplot(414); plot(t,a);
axis([0 0.15 0 1]); % smaller time interval to see wave distinctly
xlabel("Time");
ylabel("Amplitude");
title("PWM Demodulation");
