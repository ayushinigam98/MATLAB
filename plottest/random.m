x = 0:.01:10;
j = 0;
y = zeros(1,length(x));
z = zeros(1,length(x));
g = zeros(1,length(x));
k = zeros(1,length(x));
w = 1;
for i=x
    j = j+1;
    y(j) = 1/(((w*i)^2 + 1)^0.5);
    z(j) = 1/(w*i);
    k(j) = 1*i + 1;
    g(j) = 1;
end

%plot(x,y,'.');
loglog(x,y,'.');
hold on;
loglog(x,z,'r');
hold on;
loglog(x,g,'r');