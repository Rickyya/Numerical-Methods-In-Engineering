function x = LUsolut(LU,b)
%LUSOLUT Summary of this function goes here
%   Detailed explanation goes here
    if size(b, 1) == 1
        b = b';
    end
    
    % Ly=b
    aug_matrix = [LU b];
    m_size = size(aug_matrix);
    y = zeros(m_size(1), 1);
    y(1) = aug_matrix(1, m_size(2));
    for k=2:m_size(1)
        temp_sum = 0;
        for j=1:k-1
            temp_sum = temp_sum + aug_matrix(k,j)*y(j);
        end
        y(k) = aug_matrix(k, m_size(2)) - temp_sum;
    end

    %Ux=y
    aug_matrix = [LU y];
    x = zeros(m_size(1),1);
    x(m_size(1)) = aug_matrix(m_size(1),m_size(2)) / aug_matrix (m_size(1),m_size(1)); % Answer of last row in aug_matrix
    
    for k=m_size(1)-1:-1:1
        temp_sum = 0;
        for j=k+1:m_size(1)
            temp_sum = temp_sum + aug_matrix(k,j)*x(j);
        end
        x(k) = (aug_matrix(k, m_size(2)) - temp_sum)*(1/aug_matrix(k,k));
    end
end

