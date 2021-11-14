function xdot = scrub(~,x)
    load('scrub.mat');
    xdot(1) = x(2);
    xdot(2) = (phi^2)*x(1);
    xdot = xdot';
end