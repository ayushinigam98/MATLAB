function ydot = mixg(~,y)
    load('mixvar');
    %f(c) = density, y(1) = volume, y(2) = concentration
    ydot(1) = qf*(f(cf)-(fdot(y(2))*cf))/(f(y(2)) - fdot(y(2))*y(2)) - q;
    ydot(2) = qf*(y(2)*f(cf) - cf*f(y(2)))/(y(1)*(y(2)*fdot(y(2)) - f(y(2))));
 
    ydot = ydot';
end