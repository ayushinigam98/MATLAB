function vdot = cstr(t,v)
    load('flow.mat');
    vdot(1) = sin(2*t) - sin(t);
end