clear
format long
f = @(x) x.^(3)+3.8*x.^(2)-8.6*x-24.4;

% NEWTON-RHAPSON METHOD
Df = @(x) 3*x.^2 + 7.6*x-8.6;
newton_root = 2;

for i=1:5
    newton_root = newton_root - (f(newton_root)/Df(newton_root));
    %disp(newton_root)
end
x = linspace(1.6, 3.2);
hold on
xlabel("x");ylabel("y");
plot(x, zeros(1,length(x)), "-k")
plot(newton_root, f(newton_root), "Or")
plot(x, f(x), "k")
text(newton_root-0.3, f(newton_root)+1.2, "x = 2.7069")
hold off







% SECANT METHOD
x1 = 2;
x2 = 3;
disp("------------------")
for i=1:5    
    secant_root = x2 - f(x2)/((f(x1)-f(x2))/(x1-x2));
    x1 = x2;
    x2 = secant_root;
    %disp(secant_root)
end
%disp(newton_root)
%disp(secant_root)



