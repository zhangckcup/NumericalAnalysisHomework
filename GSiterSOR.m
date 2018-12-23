function u = GSiterSOR(n,w)
% 使用Gauss-Seidel迭代法求解此问题
% 数据赋值部分
    h = 1/(n+1);
    f = 3*h^2;
    u = zeros(n+2);
    i = linspace(0,1,n+2);
    u(:,1) = i.*(1-i);u(:,n+2) = u(:,1);
    e = 0.000000001;
    tic
    for k = 1:20000
        Ub = u;
        for i = 2:n+1
            for j = 2:n+1
                u(i,j) = w*(f+u(i-1,j)+u(i+1,j)+u(i,j-1)+u(i,j+1))/4+(1-w)*u(i,j);
            end
        end
        er = max(abs(Ub(:)-u(:)));
        if er<e
            break
        end
    end
    toc
    fprintf('迭代结束,k=%d,e_max=%0.12f\n',k,er);
end