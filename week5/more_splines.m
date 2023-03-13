x = [0.76, 6.66, 9.44, 16.8];
y = [3.74, 4.90, 9.97, 9.62];
xi = 1.5; % point

spl = spline(x,y);

coefs = spl.coefs;

in = 1;
for i = 2:length(x)
    if x(i) > xi
        break;
    end
    in = i;
end

dx = xi - x(in);
dydx = 3*coefs(in,1)*dx^2 + 2*coefs(in,2)*dx + coefs(in,3);
d2ydx2 = 6*coefs(in,1)*dx + 2*coefs(in,2);

% Plot:
plot(x, y, 'k.', 'MarkerSize', 10); 
hold on; 
for i = 1:length(x)-1 
    xx = x(i):0.01:x(i+1); 
    yy = spl.coefs(i,1)*(xx-x(i)).^3 + spl.coefs(i,2)*(xx-x(i)).^2 + spl.coefs(i,3)*(xx-x(i)) + spl.coefs(i,4); 
    plot(xx,yy,'b'); 
end
