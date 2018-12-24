function u = GSBlockIter(n)
% 使用Gauss-Seidel块迭代法求解此问题
    h = 1/(n+1);
    f = 3*h^2;
    u = zeros(n+2);
    i = linspace(0,1,n+2);
    u(:,1) = i.*(1-i);u(:,n+2) = u(:,1);
    e = 0.000000001;
    tic
    for k=1:2000
        er = 0;
        for j = 2:n+1
            Ub = u(:,j);
            b = f+u(2:n+1,j-1)+u(2:n+1,j+1);
            x = symzg(n,b);
            u(2:n+1,j) = x';
            er = er+norm(Ub-u(:,j),1);
        end
        if er/n^2<e
            break
        end
    end
    toc
    fprintf("迭代结束,k=%d,e_max=%0.12f\n",k,er);
end