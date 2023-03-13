function x = gauss_alt_pivot(A,b)
% GAUSS_ALT_PIVOT
%   
    if size(b, 1) == 1
        b = b';
    end

    aug_matrix = [A b];
    m_size = size(aug_matrix);

    function aug_matrix = swap_rows(aug_matrix, row1, row2)
        temp = aug_matrix(row1, :);
        aug_matrix(row1, :) = aug_matrix(row2, :);
        aug_matrix(row2, :) = temp;
    end
    
    % Forward substitution
    
    for i= 1:m_size(1)
        for j=i+1:m_size(1)
            if aug_matrix(i,i) == 0 % check if pivot is 0
                for o=i+1:m_size(1) % loop rows under pivot
                    if aug_matrix(o,i) ~= 0 % if nonzero pivot then swap
                        aug_matrix = swap_rows(aug_matrix, o, i);
                    end
                end
            end
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
    

