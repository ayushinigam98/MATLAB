close all;
clear;

do = 0.005;
load('evap.mat');
B = cp*(Tb - Ta)/l;
te = do^2/(1*8*k*log(B+1)/(2*rho*cp));

tspan = 0:(te/1000):te;
xinit = [do^2];

[t,x] = ode45('evaporate2',tspan,xinit);

plot(t,x(:,1),"r-");

xlabel("time");
ylabel("diameter");
