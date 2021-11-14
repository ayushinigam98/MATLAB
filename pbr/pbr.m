function dydw = pbr(w,y)
    global q Z R kprime alpha Pin Tin Fin
    Tout = q*y(2)/(Z*R*y(1));
    dydw(1) = -kprime*y(2);
    dydw(2) = alpha*((Pin*Tout*y(1))/(y(2)*Tin*Fin));
    dydw = dydw';
end