function x = LUsolve(A,b)
    [L,U] = LUdeco(A);
    [n,~]=size(A);
    y = ones(1,n);
    y(1) = b(1);
    for i = 2:n
        y(i) = b(i) - sum(L(i,1:i-1).*y(1:i-1));
    end
    x = ones(1,n);
    x(n) = y(n)/U(n,n);
    for i=n-1:-1:1
        x(i) = (y(i)-sum(U(i,i+1:n).*x(i+1:n)))/U(i,i);
    end
end