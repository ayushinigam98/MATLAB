function xdot = evaporate2(~,x)
    load('evap.mat');
    B = cp*(Tb - Ta)/l;
    if(x(1)>0)
        xdot(1) = -1*8*k*log(B+1)/(rho*cp);
    else
        xdot(1) = 0;
    end    
    xdot = xdot';
end