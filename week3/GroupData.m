function [f, X] = GroupData(x)
    x = usesort(x);
    min = fix(x(1));
    max = fix(x(length(x)))+1;
    X = min:1:max;
    f = zeros(1, length(X));
    for i=1:length(X)
        y = x(x >= X(i)-0.5);
        y = y(y < X(i)+0.5);
        f(i) = length(y);
    end

end

