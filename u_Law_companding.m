%%u law
close all;
fm = 10;
t = 0:0.0001:5;
m = sin(2*pi*fm*t);
mp = max(m);
x = abs(m/mp);
y = zeros(7, 50001); % Matrix to store all the values together
k=1;
for u1 = [1 10 50 100 255 500]
    y(k,:) = sign(m).*((log(1+(u1.*x)))/(log(1+u1)));
    k = k+1;
end
sym = ['s','d','*','+','o','x','v'];
for j = 1:6
    plot(x,y(j,:), sym(j))
    hold on;
end

axis([0 1 0 1]);
legend('u=1','u=10','u=50','u=100','u=255','u=500');
xlabel("Normalized Input m/mp")
ylabel("Normalized Output y")
title('u Law')

