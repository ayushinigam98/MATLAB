clear;
close all;

del = 0.1e-6;
phi = 2;
rb = 1e-3;
Ca0 = 5;
k = 1;

V = (4/3)*pi*(rb^3);
S = 4*pi*(rb^2);
Cadel = (Ca0/(cosh(phi) + (V/(S*del))*phi*sinh(phi)));
B = Cadel/Ca0;

%C2 = -1;
%C1 = B*(log(B) - 1) + 1 - (phi^2)/2;

C1 = (B*exp(phi) - 1)/(exp(2*phi) - 1);
C2 = exp(phi)*(exp(phi) - B)/(exp(2*phi) - 1);

dcdx0 = phi*C1 - phi*C2;

xspan = 0:0.1:1;
cinit = [1;dcdx0];

[x,C] = ode45('scrubfunc',xspan,cinit);

x = x*del;
C = C*Ca0;
plot(x,C(:,1));
%hold on;
%plot(x,C(:,2));

disp(Cadel);

