clear;
close all;

%initial conditions
Caf = 5;
Ca0 = 0;
Tin = 343;
T0 = 400;
Ta = 25;
%other specifications
Ear = 8330;
alpha;
h;
D;
u = 2;
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

C(1,:) = Ca0;
C(:,1) = Caf;

T(1,:) = T0;
T(:,1) = Tin;

%angan divided ra term with rho cp

for i = 1:m-1
    for j = 2:n
        ra = -k*exp(-Ear/T(i,j))*C(i,j);
        if(j == n)
            C(i+1,j) = C(i,j) + (D*(C(i,j-1) - C(i,j))/(dx^2) - u*(C(i,j) - C(i,j-1))/dx + ra)*dt;
            T(i+1,j) = T(i,j) + (alpha*(T(i,j-1) - T(i,j))/(dx^2) - u*(T(i,j) - T(i,j-1))/dx + Hr*ra + h*(T(i,j) - Ta))*dt;
        end
        C(i+1,j) = C(i,j) + (D*(C(i,j-1) - 2*C(i,j) + C(i,j+1))/(dx^2) - u*(C(i,j) - C(i,j-1))/dx + ra)*dt;
        T(i+1,j) = T(i,j) + (alpha*(T(i,j-1) - 2*T(i,j) + T(i,j+1))/(dx^2) - u*(T(i,j) - T(i,j-1))/dx + Hr*ra + h*(T(i,j) - Ta))*dt;
     end
end

subplot(1,2,1);
plot(x,C);
ylabel("conc");
xlabel("distance");

subplot(1,2,2);
plot(x,T);
ylabel("Temp");
xlabel("distance");

