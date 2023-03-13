load("fuel_economy_test.mat");

y = fuel_economy(1:length(fuel_economy)-1);
x = speed(1:length(speed)-1);
disp(x)
disp(y)
n=length(x);
k = zeros(n);
b = zeros(1,n);
for i=2:n-1
    k(i, i-1) = x(i-1)-x(i);
    k(i, i) = 2*(x(i-1)- x(i+1));
    k(i, i+1) = x(i)-x(i+1);
    b(1, i) = 6*( (y(i-1)-y(i))/(x(i-1)-x(i)) - (y(i)-y(i+1))/(x(i)-x(i+1)) );
end
k(1, 1) = 1;
k(n, n) = 1;
%disp([k b'])
m = k\b';
%disp(m)
hold on
for i=1:n-1
    lin_x = linspace(x(i), x(i+1));
    Y = spline(x,y,m,i,lin_x);
    plot(lin_x, Y, 'k');
end
plot(x,y, "Or");
plot(30, spline(x, y, m, 2, 30), "Ob") % lin_x = 30
hold off
function spline = spline(x, y, m, i, lin_x)
    spline = ((lin_x - x(i+1)).^3/(x(i) - x(i+1)) - (lin_x - x(i+1))*(x(i) - x(i+1)))*m(i)/6 - ((lin_x - x(i)).^3/(x(i) - x(i+1)) - (lin_x - x(i))*(x(i) - x(i+1)))*m(i+1)/6 + y(i)*(lin_x - x(i+1))/(x(i) - x(i+1)) - y(i+1)*(lin_x - x(i))/(x(i) - x(i+1));
end
