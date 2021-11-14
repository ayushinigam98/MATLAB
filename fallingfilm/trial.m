clear;
close all;

L = 2;
rho = 1000;
nu = 1e-3;
Dab = 1.16e-5;
Ca1 = 2;
Ca2 = 6;
u_inf = 1;

Re_crit = 3.2e5;
z_crit = nu*Re_crit/(rho*u_inf);
del_crit = 4.64*z_crit/Re_crit;

dx = del_crit/10;
dz = 0.5;

x = 0:dx:del_crit;
z = 0:dz:L;

[~,n] = size(x);
[~,m] = size(z);

C = zeros(m,n);

C(1,:) = Ca1;
C(:,1) = Ca2;

for k = 1:m-1
    for i = 2:n-1
       
           C(k+1,i) = C(k,i) + (1)*(C(k,i-1) - 2*C(k,i) + C(k,i+1))*dz;
       
    end
end

plot(x,C);

