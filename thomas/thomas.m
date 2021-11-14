close all;
clear;

K = 0.5;
F1 = 100;
F2 = 50;
%assuming values of n, xin and yin
n = 6;
xin = 0.5;
yin = 0.5;

e = zeros(n,1);
f = zeros(n,1);
g = zeros(n,1);
r = zeros(n,1);
x = zeros(n,1);

f(1) = (F1+F2*K)/K;
g(1) = -F2;
r(1) = F1*yin;

for i = 2:n-1
    e(i) = F1/K;
    f(i) = -(F1+F2*K)/K;
    g(i) = F2;
    r(i) = 0;
end

e(n) = F1/K;
f(n) = -(F1+F2*K)/K;
r(n) = -F2*xin;


for i = 2:n
   e(i) = e(i)/f(i-1);
   f(i) = f(i) - e(i)*g(i-1);
end

for i = 2:n
    r(i) = r(i) - e(i)*r(i-1);
end

x(n) = r(n)/f(n);

for i = n-1:-1:1
    x(i) = (r(i) - g(i)*x(i+1))/f(i);
end

y = x/K;

%answer displayed below

disp("xi: ");
disp(x);
disp("yi");
disp(y)
