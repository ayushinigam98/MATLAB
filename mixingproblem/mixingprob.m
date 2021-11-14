close all;
clear;

tspan = 0:0.1:10;
init = [2,5];

[t,x] = ode45('mixg',tspan,init);

plot(t,x(:,1));
hold on;
plot(t,x(:,2));