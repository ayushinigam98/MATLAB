clear;
close all;

tspan = 0:1:100;
init = [1.5,350,300]; %C T Tc

[t,x] = ode45('nonisoCSTR',tspan,init);

plot(t,x(:,2));