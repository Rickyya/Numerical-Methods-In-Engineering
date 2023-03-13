function [A,s] = MeanStD(x)
    A = sum(x) / length(x);

    s = sqrt((1/(length(x)-1)) *(sum(x.^2) - length(x)*A^2));
end

