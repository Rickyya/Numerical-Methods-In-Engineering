function LU = LUdecom(A)
%LUDECOM Summary of this function goes here
%   Detailed explanation goes here

    % Forward substitution
    U = A;
    L = zeros(size(U));
    m_size = size(U);
    for i= 1:m_size(2)-1
        for j=i+1:m_size(1)
            pivot_coefficient = U(j, i)/U(i, i);
            L(j,i) = pivot_coefficient;
            U(j,:) = U(j, :) - U(i, :)*pivot_coefficient;
        end
    end
    LU = L + U;
end
