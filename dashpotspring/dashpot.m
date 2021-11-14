function xdot = dashpot(t,x)
    load('var.mat');
    xdot(1) = x(2);
    xdot(2) = (fe - nu*x(2) - k*x(1))/m ;
    xdot = xdot';
end