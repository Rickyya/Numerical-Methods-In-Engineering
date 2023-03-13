function x = gauss_alt(A,b)
%   GAUSS_ALT
%   Gaussian elimination to solve Ax=b
    if size(b, 1) == 1
        b = b';
    end
    % Forward substitution
    aug_matrix = [A b];
    m_size = size(aug_matrix);
    for i= 1:m_size(2)-1
        for j=i+1:m_size(1)
            pivot_coefficient = aug_matrix(j, i)/aug_matrix(i, i);
            aug_matrix(j,:) = aug_matrix(j, :) - aug_matrix(i, :)*pivot_coefficient;
        end
    end
    
    x = zeros(m_size(1),1);

    % Back substitution
    x(m_size(1)) = aug_matrix(m_size(1),m_size(2)) / aug_matrix (m_size(1),m_size(1)); % Answer of last row in aug_matrix
    for k=m_size(1)-1:-1:1
        temp_sum = 0;
        for j=k+1:m_size(1)
            temp_sum = temp_sum + aug_matrix(k,j)*x(j);
        end
        x(k) = (aug_matrix(k, m_size(2)) - temp_sum)*(1/aug_matrix(k,k));
    end
end

