%A Law
close all;
clear all;
t = 0:0.01:1;
m = 2*sin(t);
mp = max(m);
x1 = m/mp;
x = abs(x1);
y = zeros(6,101); % Matrix to store all the values
k=1;
for a = [1 10 20 50 87.6 100]
    if le(x,(1/a))
        y(k,:) = ((a/(1+log(a)).*x1));
    else
        y(k,:) = ((sign(m)./(1+log(a))).*(1+log(a.*x)));
    end
    k=k+1;
end

sym = ['s','d','*','+','o','x','v'];
for j=1:6
    plot(x1, y(j,:), sym(j))
    hold on
end

axis([0 1 0 1]);
legend('A=1','A=10','A=20','A=50','A=87.6','A=100');
xlabel("Normalized Input m/mp")
ylabel("Normalized Output y")
title('A Law')
