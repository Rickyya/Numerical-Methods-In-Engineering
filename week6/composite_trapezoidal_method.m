function I = CompTrapez(func, a, b)
%COMPTRAPEZ Summary of this function goes here
%   Detailed explanation goes here

    sub_intervals = 2;
    h = (b-a)/sub_intervals;
    dx = a:h:b;
    error = 10^9;
    I0 = 0;
    while error > 0.01
        disp(dx)
        I = (h/2) * (sum(func(dx(1:sub_intervals))) + sum(func(dx(2:sub_intervals))));

        sub_intervals = sub_intervals * 2;
        h = (b-a)/sub_intervals;
        dx = a:h:b;
        error = I - I0;
        I0 = I;
    end
end

