function xNS = RegulaFalsiRootMod1(f,a,b,err, imax)
%REGULAFALSI Summary of this function goes here
%   Detailed explanation goes here
    format long
    if nargin < 4
        err = 0.0001;
        imax = 100;
    end
    a_counter = 1;
    b_counter = 1;
    xNS = 0;
    for i=1:imax
        a_ = a; % a(i-1)
        b_ = b; % b(i-1)
        disp([a b])
        xNS_ = xNS; % xNS(i-1)
        f_a = feval(f,a);
        f_b = feval(f,b);
        if rem(a_counter, 3) == 0
            f_a = f_a / 2^(a_counter/3);
            b_counter = 1;
        elseif rem(b_counter, 3) == 0
            f_b = f_b / 2^(b_counter/3);
            disp(f_b)
            a_counter = 1;
        end
        
        xNS = (a*f_b-b*f_a)/(f_b-f_a);
        if f_a*feval(f,xNS) < 0
            b = xNS;
        else
            a = xNS;
        end
        
        if a == a_
            a_counter = a_counter + 1;
            b_counter = 1;
        elseif b == b_
            b_counter = b_counter + 1;
            a_counter = 1;
        end

        if abs((xNS-xNS_)/xNS_) <= err
            break
        end
    end
    if i==imax
        fprintf("%s %d %s", "The program didn't derive a solution within",imax, "iterations.")
    else
        fprintf("%s %f \n%s %f \n%s %d\n", "Found root at x =",xNS, "Error less than:", err, "Iterations:", i)
    end
end

