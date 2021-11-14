function ydot = nonisoCSTR(~,y)
    load('thermpfr');
    
    ra = -1*k*exp(-1*Ear/y(2))*y(1);
   
    k1 = qf*rhof*cpf;
    k2 = u*A;%50000
    k3 = ra*V*HR;
    k4 = rho*V*cp;
    k5 = qfc*rhofc*cpfc;%15000
    k6 = rhoc*Vc*cpc;%1500
    
    ydot(1) = (qf*Cf - q*y(1) + ra*V)/V;
    ydot(2) = (k1*(Tf - y(2)) - k2*(y(2) - y(3)) + k3)/k4;
    ydot(3) = (k5*(Tfc - y(3)) + k2*(y(2) - y(3)))/k6;
    
    ydot = ydot';
    
end