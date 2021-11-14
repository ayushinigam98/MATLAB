clear all
close all
clc

global q Z R kprime alpha Pin Tin Fin
wspan = 0:1:15;

kprime = 0.03;
alpha = 0.04;
W = 15;
q = 2000;
Cao = 10e-3;
Ea = 6/5;
Z = 0.8;
R = 8.314;
Tin = 500;
Fin = q * Cao;
Pin = Z*8.314*Tin/q;
BC = [Fin;Pin];

[w,x] = ode45('pbr',wspan,BC);

Xa = (Cao-(x(:,1)/q))./(Cao+Ea*(x(:,1)/q));

figure(1);
plot(w,x(:,1)/q),xlabel('Weight(kg)'),ylabel('Conc.(mol/m^3)')

figure(2);
plot(w,x(:,2)),xlabel('Weight(kg)'),ylabel('Pressure(Pa)')

figure(3);
plot(x(:,1)/q,x(:,2)),xlabel('Conc.(mol/m^3)'),ylabel('Pressure(Pa)')

figure(4);
plot(w,Xa),xlabel('Weight(kg)'),ylabel('Conversion')