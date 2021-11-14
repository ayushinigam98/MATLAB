clear all
close all
clc

L=0.1:0.1:2;
Re=3.5e+5;
u_inf=1;
rho=1000;
nu=0.001;
Ca2=3;
Ca1=2;
Dab=1e-5;

delta_f=4.64*1.5/Re;
delta=delta_f*ones(1,length(L));
for i=1:15
    delta(i)=4.64*L(i)/Re;
end
x=1e-6:1e-6:delta_f;
delta_x=1e-6;
delta_z=0.1;
Ca=zeros(length(x),length(L));
Ca(1,:)=Ca2;
Ca(2:end,1)=Ca1;

for f=1:5
for i=2:length(L)
    if i<16
    for j=2:i
        w=(x(j)/delta(i));
        k=2*Dab/delta_x^2-(3/2*w^2-1/2*w)/delta_z;
        Ca(j,i)=(Dab/(delta_x)^2*(Ca(j+1,i)+Ca(j-1,i))-(3/2*w^2-1/2*w)*Ca(j,i-1)/delta_z)/k;
    end
    else
    for j=16:18
        k=2*Dab/delta_x^2-(1-x(j)/delta_f^2)/delta_z;
        Ca(j,i)=(Dab/(delta_x)^2*(Ca(j+1,i)+Ca(j-1,i))-(1-x(j)/delta_f^2)*Ca(j,i-1)/delta_z)/k;
    end
    end
end
end  
%plot(x,Ca);
surf(Ca);