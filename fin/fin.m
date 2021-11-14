clear;
close all;

%initial conditions
Tin = 30;
Ta = 25;
T0 = Ta;
%other specifications
alpha = 1.172e-5;
k = 40;
h = 100;
A = 2*sqrt(pi)*0.1; %2*pi*r*dx
V = 0.1; %pi*r^2*dx
rhocp = 3.41e6;

L = 5;
dx = 0.1;
dt = 0.1;
t = 0:dt:100;
x = 0:dx:10;

[~,n] = size(x);
[~,m] = size(t);

T = zeros(m,n);

T(1,:) = T0;
T(:,1) = Tin;

%angan divided ra term with rho cp

for i = 1:m-1
    for j = 2:n
        if(j == n)
            T(i+1,j) = T(i,j) + (alpha*1000*(T(i,j-1) - T(i,j))/(dx^2) - (h*A/(rhocp*V))*(T(i,j) - Ta))*dt;
        else
            T(i+1,j) = T(i,j) + (alpha*1000*(T(i,j-1) - 2*T(i,j) + T(i,j+1))/(dx^2) - (h*A/(rhocp*V))*(T(i,j) - Ta))*dt;
        end
     end
end

plot(x,T);
ylabel("Temp");
xlabel("distance");

