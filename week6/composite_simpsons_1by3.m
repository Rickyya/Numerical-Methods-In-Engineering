clear
clc

f = @(x) sqrt(1-x.^2);
h = 2/8;
dx = -1:h:1;

sum_even = sum(f([dx(2) dx(4) dx(6) dx(8)]));
sum_odd = sum(f([dx(3) dx(5) dx(7)]));
answer = h/3 * (f(-1) + 4*sum_even + 2*sum_odd + f(1));
