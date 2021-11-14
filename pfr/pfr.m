clear;
close all;

Caf = 5;
Cao = 0;
k = 1;
u = 2;
L = 5;
dx = 0.5;
dt = 0.1;
t = 0:dt:100;
x = 0:0.5:5;

[~,n] = size(x);
[~,m] = size(t);

C = zeros(m,n);

C(1,:) = Cao;
C(:,1) = Caf;

for i = 1:m-1
   for j = 2:n
       C(i+1,j) = C(i,j) + ((u*C(i,j-1) - C(i,j)*(u+k))*dt)/dx;     
   end
end

plot(x,C);


