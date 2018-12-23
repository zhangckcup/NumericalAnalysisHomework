clc,clear;
% 网格密度n
n = 10;
% 构造线性方程组与辅助变量的赋值
A = diag(4*ones(1,n))+diag(-ones(1,n-1),-1)+diag(-ones(1,n-1),1);
I = -eye(n);
AA = zeros(n*n);
for i = 1:n
    AA(n*i-n+1:n*i,n*i-n+1:n*i) = A;
end
for i =1:n-1
    AA(n*i-n+1:n*i,n*(i+1)-n+1:n*(i+1)) = I;
    AA(n*(i+1)-n+1:n*(i+1),n*i-n+1:n*i) = I;
end
h = 1/(n-1);
f = (3-2)*h^2*ones(n*n,1);
x = linspace(0,1,n);
% v = u - x(1-x)
v = meshgrid(x.*(1-x));
tic
U = LUsolve(AA,f);
toc
tic
U = GaussElim(AA,f);
toc
U = reshape(U,10,10);
U = U + v;
surf(U);
