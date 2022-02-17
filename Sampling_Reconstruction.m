clear all;
close all;
t=-10:0.01:10;
T=6;
fm=1/T;

x=cos(2*pi*fm*t); % input signal
subplot(2,2,1); plot(t,x);
xlabel('time'); ylabel('x(t)'); title('Continous Time signal');

fs1=1.6*fm; % Less than Nyquist
fs2=2*fm;   % Equal to Nyquist
fs3=8*fm;   % More than Nyquist

%fs<2fm
n1=-4:1:4;
x1=cos(2*pi*fm/fs1*n1);
subplot(2,2,2); stem(n1,x1);
xlabel('time');ylabel('x(n)');
title('Signal with fs<2fm');
hold on
subplot(2,2,2);
plot(n1,x1)

%fs=2fm
n2=-5:1:5;
x2=cos(2*pi*fm/fs2*n2);
subplot(2,2,3); stem(n2,x2);
xlabel('time');ylabel('x(n)');
title('Signal with fs=2fm');
hold on;
subplot(2,2,3); plot(n2,x2)

%fs>2fm
n3=-20:1:20;
x3=cos(2*pi*fm/fs3*n3);
subplot(2,2,4); stem(n3,x3);
xlabel('time'); ylabel('x(n)');
title('Signal with fs>2fm');
hold on;
subplot(2,2,4); plot(n3,x3);

% Reconstruction of signal

fm = 40;     % frequency of signal
fs = 2*fm    % sampling rate
Ts = 1/fs;   % sampling period
nc = 4;      %number of cycles of message

tm = 0:0.0001:nc/fm;
Xm = cos(2*pi*fm*tm); % message signal
figure;
subplot(311); plot(tm,Xm)
xlabel('Time [sec]')
ylabel('Amplitude')
title('Message Signal')

td = 0:1/fs:nc/fm;         
Xd = cos(2*pi*fm*td); % sampled signal
N = length(td);
subplot(312); stem(td,Xd)
xlabel('Time [sec]')
ylabel('Amplitude')
title('Sampled Signal')

Xr = zeros(size(tm));
sinc = zeros(N,length(tm));
for t = 1:length(tm)
    for n = 0:N-1
        sinc(n+1,:) = sin(pi*(tm-n*Ts)/Ts)./(pi*(tm-n*Ts)/Ts);
        theta = pi*(tm(t)-n*Ts)/Ts;
        Xr(t) = Xr(t) + Xd(n+1)*sin(theta)/theta;
    end
end

subplot(313); plot(tm,Xr)
xlabel('Time [sec]')
ylabel('Amplitude')
title('Reconstructed Signal')
