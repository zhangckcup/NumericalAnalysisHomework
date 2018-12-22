function x = GaussElim2(A,b)
% 针对本题（三对角情况）改进了的Gauss消元法
    [n,m] = size(A);
    if n~=m
        error('传入矩阵必须为方阵');
    end
    B = [A,b];
    for j=1:n-1
        m = -B(j+1,j)/B(j,j);
        B(j+1,:) = m*B(j,:)+B(j+1,:);
    end
    x = zeros(1,n);
    x(n) = B(n,n+1)/B(n,n);
    for j=n-1:-1:1
        x(j) = (B(j,n+1)-B(j,j+1)*(x(j+1)))/B(j,j);
    end
end