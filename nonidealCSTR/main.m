clear;
close all;

load('nonidealvar');
C = newton(0,1e-4);
Ce = (n*q*C + (1-n)*q*Cf)/q;

