clear
format long

% x = r/2 => 4sin(theta)-3theta = 0

f = @(t) 4*sin(t)-3*t;
a = 1;
b = 2;
xNS = 1;
ERE = [];
i = 1;
while true
    xNS_ = xNS; % xNS(i-1)
    xNS = (a+b)/2;
    if f(a)*f(xNS) < 0
        b = xNS;
    elseif f(a)*f(xNS) > 0
        a = xNS;
    end

    ERE(i) = abs((xNS-xNS_)/xNS_);
    i = i + 1;

    if (abs(b-a))/2 <= 0.002
        break
    end
end
disp("Errors for each of the iterations: ")
disp(ERE)
disp("Result:")
disp(xNS)

