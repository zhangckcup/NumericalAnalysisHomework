function u = Jacobi(n)
% 本题的Jacobi方法求解
% 数据赋值部分
    h = 1/(n+1);
    f = 3*h^2;
    u = zeros(n+2);
    i = linspace(0,1,n+2);
    u(:,1) = i.*(1-i);u(:,n+2) = u(:,1);
    e = 0.000000001;
    for k = 1:20000
        Ub = u;
        u(2:n+1,2:n+1) = (f+u(1:n,2:n+1)+u(3:end,2:n+1)+u(2:n+1,3:end)+u(2:n+1,1:n))/4;
        er = max(abs(Ub(:)-u(:)));
        if er<e
            break
        end
    end
    fprintf("迭代结束,i=%d,e_max=%0.12f\n",k,er);
end