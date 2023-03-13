load('CubPolFit_test.mat')
[a, Er] = CubPolFit(Strain_x, Stress_y);
f = @(x) a(1) + a(2).*x + a(3)*x.^2 + a(4)*x.^3;
x = -1:0.01:7;
plot(x,f(x), 'k')
hold on
plot(Strain_x, Stress_y, '*r');
hold off