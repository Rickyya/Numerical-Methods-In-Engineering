function I = Simp38(func, a, b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    sub_intervals = 3;
    
    error = 10^9;
    I0 = 0;
    while error > 0.01
        h = (b-a)/sub_intervals;
        dx = a:h:b; % All intervals
        dxx = 2:3:sub_intervals-1; % First sum x intervals
        sum_a = sum([func([dx(dxx) dx(dxx+1)])]); % First sum

        dxx = 4:3:sub_intervals-2; % Second sum x intervals
        sum_b = sum(func(dx(dxx))); % Second sum
        
        I = (3*h/8) * (func(a) + 3*sum_a + 2*sum_b + func(b));
        error = (I - I0);
        I0 = I;
        sub_intervals = sub_intervals * 2;
        
    end
end

