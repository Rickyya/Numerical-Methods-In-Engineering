clear
clc

f = @(x) sqrt(1-x.^2);
h = 2/9;
dx = -1:h:1;

sum_a = sum([f([dx(2) dx(3)]), f([dx(5) dx(6)]), f([dx(8) dx(9)])]);
sum_b = sum(f([dx(4) dx(7)]));
answer = 3*h/8 * (f(-1) + 3*sum_a + 2*sum_b + f(1));
