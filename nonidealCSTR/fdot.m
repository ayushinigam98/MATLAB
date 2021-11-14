function x = fdot(C)
    load('nonidealvar');
    x = -(n*q/(m*V)) - k1*(1 - (k2^2)*(C^2))/((1 + k2*C)^4); 
end