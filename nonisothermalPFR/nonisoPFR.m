clear;
close all;

%initial conditions
Caf = 5;
Ca0 = 0;
Tf = 343;
T0 = 400;
Tfc = 300;
T0c = 300;
%other specifications
Ear = 8330;
cp = 2;
rho = 1000000;
cpc = 1;
rhoc = 10000;
k = 1;
u = 2;
uc = 2;
U = 1000;
A = 50;
Hr = -130e6;
L = 5;
dx = 0.5;
dt = 0.1;
t = 0:dt:100;
x = 0:0.5:5;

[~,n] = size(x);
[~,m] = size(t);


C = zeros(m,n);
T = zeros(m,n);
Tc = zeros(m,n);

C(1,:) = Ca0;
C(:,1) = Caf;

T(1,:) = T0;
T(:,1) = Tf;

Tc(1,:) = T0c;
Tc(:,1) = Tfc;

for i = 1:m-1
    for j = 2:n
        ra = -k*exp(-Ear/T(i,j))*C(i,j);
        C(i+1,j) = C(i,j) + (u*(C(i,j-1)- C(i,j))/dx + ra)*dt;
        T(i+1,j) = T(i,j) + (u*(T(i,j-1) - T(i,j))/dx - (ra*Hr/(rho*cp)) - U*A*(T(i,j) - Tc(i,j))/(rho*cp))*dt;
        Tc(i+1,j) = Tc(i,j) + ((uc*(T(i,j-1)-T(i,j))/dx) + U*A*(T(i,j) - Tc(i,j))/(rhoc*cpc))*dt;
     end
end
subplot(1,3,1);
plot(x,C);
ylabel("conc");
xlabel("distance");

subplot(1,3,2);
plot(x,T);
ylabel("Temp");
xlabel("distance");

subplot(1,3,3);
plot(x,Tc);
ylabel("temp coolant");
xlabel("distance");
