function [a,Er] = CubPolFit(x,y)
%CUBEPOLY Summary of this function goes here
%   Detailed explanation goes here
    xsum = [length(x), sum(x), sum(x.^2), sum(x.^3); sum(x), sum(x.^2), sum(x.^3), sum(x.^4);sum(x.^2), sum(x.^3), sum(x.^4), sum(x.^5);sum(x.^3), sum(x.^4), sum(x.^5), sum(x.^6)];
    ysum = [sum(y); sum(x.*y); sum((x.^2).*y); sum((x.^3).*y)];
    a = xsum\ysum;

    f =@(x) a(1) + a(2).*x + a(3)*x.^2 + a(4)*x.^3;
    Er=(sum((y-f(x)).^2));
end

