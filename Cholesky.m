function L = Cholesky(A)
    [n,m] = size(A);
    if n~=m && det(A)<=0
        error('矩阵必须为对称正定方阵')
    end
    L = zeros(n);
    L(1,1) = sqrt(A(1,1));
    L(2:n,1) = A(2:n,1)/L(1,1);
    for j=2:n
        L(j,j)=sqrt(A(j,j)-sum(L(j,1:j-1).^2));
        for i=j+1:n
            L(i,j) = (A(i,j)-sum(L(i,1:j-1).*L(j,1:j-1)))/L(j,j);
        end
    end
end