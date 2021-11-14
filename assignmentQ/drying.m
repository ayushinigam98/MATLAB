function Tdot = drying(t,T)
    load('dryvar.mat');
    
    dx = 1;
    if(t<=8000)
        Mev = 200e-6;
    elseif(t>=8000 && t<17000)
        Mev = 100e-6;
    else
        Mev = 0;
    end
    
    Tdot(1) = (Ks/rhocp)*(T(2) - T(1))/(dx);
    Tdot(2) = (Ks/rhocp)*(T(1) - 2*T(2) + T(3))/(dx^2);
    Tdot(3) = (Ks/rhocp)*(T(2) - 2*T(3) + T(4))/(dx^2);
    Tdot(4) = (Ks/rhocp)*(T(3) - T(4))/(dx) - (Kair/rhocp)*(T(4) - 343)/(dx) - Hev*Mev/(rhocp);
    
    Tdot = Tdot';
end