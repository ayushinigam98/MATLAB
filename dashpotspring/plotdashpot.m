close all;
clear;
tspan = 0:0.1:100;
xinit = [0;0];

[t,x] = ode45('dashpot',tspan,xinit);

plot(t,x(:,1),"r-");
xlabel("time");
ylabel("displacement");