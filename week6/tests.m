clear

z = 0:1:12;
d = [0 2.6 3.2 4.8 5.6 6 6.2 6 5.6 4.8 3.3 2.6 0];

% Q1 Surface area
r = d/2;
coefs = polyfit(z,r,4);
f = @(x) coefs(1)*x.^4+coefs(2)*x.^3+coefs(3)*x.^2+coefs(4)*x+coefs(5);

surface_area = 2*pi*Simp38(f, 0, 12);


% Q1 Volume
r = (d/2).^2;
coefs = polyfit(z,r,4);
f = @(x) coefs(1)*x.^4+coefs(2)*x.^3+coefs(3)*x.^2+coefs(4)*x+coefs(5);

volume = pi*Simp38(f, 0, 12);

disp(["Surface area: " surface_area "    Volume: " volume])


% Q2 
f = @(x) sqrt(1-x.^2);
I = Simp38(f, -1, 1);
disp(["The integral evaluates to: " I])







