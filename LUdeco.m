function [L,U] = LUdeco(A)
% 方阵的LU分解，输入方阵A，输出L U矩阵
    [n,m] = size(A);
    if n~=m
        error('输入的矩阵必须为方阵')
    end
    L = zeros(n);
    for j=1:n
        for i=j+1:n
            if A(j,j)~=0
                L(i,j) = -A(i,j)/A(j,j);
                A(i,:) = L(i,j)*A(j,:)+A(i,:);
            end
        end
    end
    L = eye(n)-L;
    U = A;
end