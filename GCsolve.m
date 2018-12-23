function x = GCsolve(A,b)
% 共轭斜量法，解线性方程组
% 1.x0,r0,p0初始化
    x = b;
    r = b-A*x;
    p = r;
    % 2.按照书上的步骤对其进行迭代
    for k =1:2000
        a = dot(r(:),r(:))/dot(A*p,p);
        x = x +a*p;
        r1 = r - a*A*p;
        if sum(abs(r1))<0.00000001
            break
        end
        beta = dot(r1,r1)/dot(r,r);r = r1;
        p = r + beta*p;
    end
end 