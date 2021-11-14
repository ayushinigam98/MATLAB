clear;
close all;

del = 0.1e-6;
phi = 2;
rb = 1e-3;
Ca0 = 5;
k = 1;

B = 0.2;

C2 = -1;
C1 = B*(log(B) - 1) + 1 - (phi^2)/2;

xspan = 1:-0.1:0;
cinit = [B;((phi^2)*B + C1)/log(B)];

[x,C] = ode45('scrub',xspan,cinit);

plot(x,C(:,1));

