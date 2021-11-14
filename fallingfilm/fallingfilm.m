clear;
close all;

L = 2; %lenght 
rho = 1000;  %density
nu = 1e-3;  %viscosity
Dab = 1.16e-5;  %diffusion coefficient
Ca1 = 0.2; 
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
    if(z(k)<z_crit)
        Re = rho*u_inf*z(k)/nu;
        del = 4.64*z(k)/sqrt(Re);
    else
        del = del_crit;
    end
    
    for i = 2:n
       if(z(k)<z_crit)
           uz = ((3/2)*(x(i)/del) - (1/2)*(x(i)/del)^3)*u_inf;
       else
           uz = (1 - (x(i)/del)^2)*u_inf;
       end
       
       if(x(i)<del && i~=n)
           C(k,i) = C(k-1,i) - (Dab/uz)*(C(k-1,i-1) - 2*C(k-1,i) + C(k-1,i+1))*dz/(dx^2);
       else
           C(k,i) = C(k,i-1);
       end
    end
end

plot(x,C);

