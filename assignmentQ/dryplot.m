close all;
clear;
tspan = 0:1:30000;
Tinit = [29;29;29;29];

[t,T] = ode45('drying',tspan,Tinit);

plot(t,T(:,1),"r");
hold on;
plot(t,T(:,2),"b");
plot(t,T(:,3),"g");
plot(t,T(:,4),"y");
xlabel("time");
ylabel("temperature");