function ydot = mix(~,y)
    load('mixvar');
    
    ydot(1) = qf - q;
    ydot(2) = qf*(cf - y(2))/y(1);
    ydot = ydot';
end