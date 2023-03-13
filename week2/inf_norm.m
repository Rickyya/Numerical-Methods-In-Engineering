function infNorm = inf_norm(A)
%INF_NORM Summary of this function goes here
%   Detailed explanation goes here
    B = zeros(1,size(A,1));
    for i=1:size(A,1)
        B(i) = sum(abs(A(i,:)));
    end
    infNorm = B(1);
    for i=2:size(B,2)
        if B(i) > infNorm
            infNorm = B(i);
        end
    end
end

