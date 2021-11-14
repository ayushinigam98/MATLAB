close all;
clear;

do = 0.005;
load('evap.mat');
B = cp*(Tb - Ta)/l;
te = do^2/(1*8*k*log(B+1)/(rho*cp));

tspan = 0:(te/1000):te;
xinit = [do];

[t,x] = ode45('evaporate',tspan,xinit);

plot(t,x(:,1),"r-");

xlabel("time");
ylabel("diameter");
