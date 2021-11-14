function x = f(C)
    load('nonidealvar');
    x = (n*q/(m*V))*Cf - (n*q/(m*V))*C - k1*C/(1 + k2*C)^2 ;
end