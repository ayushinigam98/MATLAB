clear;
close all;

L = 2; %lenght 
rho = 1000;  %density
nu = 1e-3;  %viscosity
Dab = 1.16e-5;  %diffusion coefficient
Ca1 = 5; 
Ca2 = 10;
u_inf = 1;  %velocity of free stream

Re_crit = 3.2e5; %critical Re no. 
z_crit = nu*Re_crit/(rho*u_inf); %critical z value
del_crit = 4.64*z_crit/Re_crit;  %critical boundary thickness

dx = del_crit/10;
dz = 0.1;

x = 0:dx:del_crit;
z = 0:dz:L;

[~,n] = size(x);
[~,m] = size(z);

C = zeros(m,n);

C(1,:) = Ca1;
C(:,1) = Ca2;

for k = 2:m
    Re = rho*u_inf*z(k)/nu;
    if(Re<Re_crit)
        del = 4.64*z(k)/Re;
    else
        del = del_crit;
    end
    %assigning value of del based on reynolds no. at that value of z
    for i = 2:n
        if(x(i)<(del_crit - del))
            uz = u_inf;
        else
            uz = (3/2)*(x(i)/del)^2 - (1/2)*(x(i)/del);
        end
        %assigning velocity depending on distance from platform
        if(x(i) == del_crit)
            C(k,i) = C(k,i-1);
        else
            C(k,i) = C(k-1,i) + (Dab/uz)*(1e-10)*(C(k-1,i+1) - 2*C(k-1,i) + C(k-1,i-1))*(dz/(dx^2));
        end
    end
end

plot(x,C);
%surf(C);
