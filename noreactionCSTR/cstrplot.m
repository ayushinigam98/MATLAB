close all;

tspan = 0:0.1:100;
vinit = [10];

[t,x] = ode45('cstr',tspan,vinit);

plot(t,x(:,1),"r-");
ylabel('volume');
xlabel('time');
