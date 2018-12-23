function u = GSBSORiter(n,w)
    % 使用Gauss-Seidel迭代法求解此问题
    % 数据赋值部分
    h = 1/(n+1);
    f = 3*h^2;
    u = zeros(n+2);
    i = linspace(0,1,n+2);
    u(:,1) = i.*(1-i);u(:,n+2) = u(:,1);
    e = 0.000000001;
    A = diag(4*ones(1,n))+diag(-ones(1,n-1),-1)+diag(-ones(1,n-1),1);
    for k=1:2000
        er = 0;
        for i = 2:n+1
            Ub = u(:,i);
            b = (1-w)*A*u(2:n+1,i)+w*(f+u(2:n+1,i-1)+u(2:n+1,i+1));
            x = symzg(n,b);
            u(2:n+1,i) = x';
            er = er+norm(Ub-u(:,i),1);
        end
        if er/n^2<e
            break
        end
    end
    fprintf("迭代结束,k=%d,e_max=%0.12f\n",k,er);
end