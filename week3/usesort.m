function x = usesort(x)
    for i=1:length(x)-1
        for j=i+1:length(x)
            if x(i) > x(j)
                x = swap(x, i, j);
            end
        end
    end

    function x = swap(x, i, j)
        temp = x(j);
        x(j) = x(i);
        x(i) = temp;
    end
end
