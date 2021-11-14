function x = newton(x,es)
    ea = es+1;
    while(ea>es)
       temp = x;
       x = x - f(x)/fdot(x);
       ea = abs((x - temp)/x);
    end    
end