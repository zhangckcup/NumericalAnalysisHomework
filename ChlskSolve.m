function x = ChlskSolve(A,b)
    L = Cholesky(A);
    n = length(b);
    
    % y = L\b;
    y = ones(1,n);
    y(1) = b(1);
    for i = 2:n
        y(i) = (b(i) - sum(L(i,1:i-1).*y(1:i-1)))/L(i,i);
    end
    % x = L'\y;
    L = L';
    x = ones(1,n);
    x(n) = y(n)/L(n,n);
    for i=n-1:-1:1
        x(i) = (y(i)-sum(L(i,i+1:n).*x(i+1:n)))/L(i,i);
    end
end