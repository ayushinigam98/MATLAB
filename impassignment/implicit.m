clear all;
close;

k1 = 5/3;
k2 = 5/6;
k3 = 1/6;

CAin = 10;
fv = 0.5417;

dt = 0.1;
tend = 20;

t = 0:dt:tend;

f = @(k1,k2,k3,CAin,fv,dt,Ca,Cb,x) [x(1)*(1 + (fv + k1)*dt)+k3*dt*x(1)^2 - (fv*dt*CAin + Ca); ...
    -k1*x(1)*dt + x(2)*(1 + (fv+k2)*dt)  - Cb];
J = @(k1,k2,k3,CAin,fv,dt,Ca,Cb,x) [(1 + (fv + k1)*dt)+2*k3*dt*x(1) 0; -k1*dt 1+(fv+k2)*dt];
%implicit method
yi = zeros(length(t),2);
Ca = 0;
Cb = 0;
x = yi(1,:);
esp = 1e-4;

for i = 1:length(t)-1
    while 1==1
        dx = -inv(J(k1,k2,k3,CAin,fv,dt,Ca,Cb,x))*f(k1,k2,k3,CAin,fv,dt,Ca,Cb,x);
        x = x+dx';
        if abs(dx)<esp
            break;
        end
    end
    yi(i+1,:) = x;
    x = yi(i,:);
    Ca = yi(i,1);
    Cb = yi(i,2);
end    

plot(t,yi);