function x = ChlskSolve(A,b)
    L = Cholesky(A);
    y = L\b;
    x = L'\y;
end