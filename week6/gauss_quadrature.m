clear 
clc
f = @(x) sqrt(1-x.^2);
C1 = 1;
C2 = 1;

x1 = -0.57735027;
x2 = 0.57735027;

answer = sum([f(x1)*C1 f(x2)*C2]);