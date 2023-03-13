load('Uniaxal_Tension_test.mat')
format longE
A_0 = 1.25*10^-4;
L_0 = 0.0125;
x = log(log(L ./ L_0));
y = log((F.*L) / (A_0*L_0));

nx=length(x);

Sx=sum(x);
Sy=sum(y);
Sxy=sum(x.*y);
Sxx=sum(x.^2);
m=(nx*Sxy-Sx*Sy)/(nx*Sxx-Sx^2);
K=(Sxx*Sy-Sxy*Sx)/(nx*Sxx-Sx^2);

f = @(x) m.*x+K;

plot(x, f(x), '-r')
hold on
plot(x,y, 'Or')
hold off