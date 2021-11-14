clear;
close all;

L = 4.6400e-06; %lenght 
rho = 1000;  %density
nu = 1e-3;  %viscosity
Dab = 1.16e-5;  %diffusion coefficient
Ca1 = 5; 
Ca2 = 10;
u_inf = 1;  %velocity of free stream

Re_crit = 3.5e5; %critical Re no. 
z_crit = nu*Re_crit/(rho*u_inf); %critical z value
del_crit = 4.64*z_crit/Re_crit;  %critical boundary thickness
s = 1;%1e-1;
dx = del_crit/10;
dz = dx*dx/(10*Dab);

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
            uz = (3/2)*((del_crit - x(i))/del) - (1/2)*((del_crit - x(i))/del)^3;
        end
        %assigning velocity depending on distance from platform
        if(x(i) == del_crit)
            C(k,i) = C(k,i-1);
        else
            C(k,i) = C(k-1,i) + (Dab*s/uz)*(C(k-1,i+1) - 2*C(k-1,i) + C(k-1,i-1))*(dz/(dx^2));
        end
    end
end

plot(x,C); %please comment it and uncomment next line if you want to see the 3D plot
%surf(C); %please uncomment this line to see 3D plot
