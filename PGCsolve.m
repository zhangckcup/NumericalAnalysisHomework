function x = PGCsolve(A,b)
% 预条件共轭斜量法，解线性方程组
    M = diag(diag(A));
    x = b;
    r = b-A*x;
    Z = LUsolve(M,r)';
    p = Z;
    % 2.按照书上的步骤对其进行迭代
    for k =1:2000
        a = dot(Z,r)/dot(A*p,p);
        x = x +a*p;
        r1 = r - a*A*p;
        Z1 = LUsolve(M,r1)';
        if sum(abs(r1))<0.00000001
            break
        end
        beta = dot(Z1,r1)/dot(Z,r);
        r = r1; Z = Z1;
        p = Z + beta*p;
    end
end 