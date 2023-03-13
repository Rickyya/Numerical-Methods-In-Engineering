load('fuel_economy_test.mat');
x = speed;
y = fuel_economy;

n = 3*length(x) - 4;
%Az = b
b = zeros(1,n);

b(1) = y(1);
b(2) = y(2);
b(3) = y(2);
b(4) = y(3);
b(5) = y(3);
b(6) = y(4);
b(7) = y(4);
b(8) = y(5);

A = [x(1) 1 0 0 0 0 0 0 0 0 0;
     x(2) 1 0 0 0 0 0 0 0 0 0 ;
     0 0 x(2)^2 x(2) 1 0 0 0 0 0 0;
     0 0 x(3)^2 x(3) 1 0 0 0 0 0 0;
     0 0 0 0 0 x(3)^2 x(3) 1 0 0 0;
     0 0 0 0 0 x(4)^2 x(4) 1 0 0 0;
     0 0 0 0 0 0 0 0 x(4)^2 x(4) 1;
     0 0 0 0 0 0 0 0 x(5)^2 x(5) 1;
     1 0 -2*x(2) -1 0 0 0 0 0 0 0;
     0 0  2*x(3) 1 0 -2*x(3) -1 0 0 0 0;
     0 0 0 0 0 2*x(4) 1 0 -2*x(4) -1 0];

z = A\b';

b1 = z(1);
c1 = z(2);
a2 = z(3);
b2 = z(4);
c2 = z(5);
a3 = z(6);
b3 = z(7);
c3 = z(8);
a4 = z(9);
b4 = z(10);
c4 = z(11);

st = 0.01;

x1 = linspace(x(1), x(2), fix((x(2) - x(1))/st));
x2 = linspace(x(2), x(3), fix((x(3) - x(2))/st));
x3 = linspace(x(3), x(4), fix((x(4) - x(3))/st));
x4 = linspace(x(4), x(5), fix((x(5) - x(4))/st));

% Evaluate the piecewise functions
f1 = b1*x1 + c1;
f2 = a2*x2.^2 + b2*x2 + c2;
f3 = a3*x3.^2 + b3*x3 + c3;
f4 = a4*x4.^2 + b4*x4 + c4;

% Plot the piecewise functions and the knot points
hold on;
plot(30, a2*30^2 + b2*30 + c2, 'Ob'); % speed = 30
plot(60, a4*60^2 + b4*60 + c4, 'Ob'); % speed = 60
text(30, a2*30^2 + b2*30 + c2 + 1.5, "Speed = 30")
text(60, a4*60^2 + b4*60 + c4 + 1.5, "Speed = 60")

plot(x1, f1, 'k', x2, f2, 'k', x3, f3, 'k', x4, f4, 'k', x, y, '*r');
xlabel('Speed (mph)');
ylabel('Fuel economy (mpg)');


