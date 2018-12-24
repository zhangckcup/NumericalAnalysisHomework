clc,clear;
%% 各种算法及其运行时间

% 构造线性方程组与辅助变量的赋值
% 网格密度n
n = 10;
% 对角矩阵Aii
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
% 构造方程右端
h = 1/(n-1);
f = (3-2)*h^2*ones(n*n,1);
x = linspace(0,1,n);
% v = u - x(1-x)
v = meshgrid(x.*(1-x))';
%% 时间测试开始

%% LU分解法的求解时间，及结果绘图
tic
U = LUsolve(AA,f);
toc
u = reshape(U,n,n)+v;
surf(u);

%% 高斯消元法的求解时间及结果绘图
tic
U = GaussElim(AA,f);
toc
u = reshape(U,n,n)+v;
surf(u);

%% Cholesky分解求解时间及结果绘图
tic
U = ChlskSolve(AA,f);
toc
u = reshape(U,n,n)+v;
surf(u);

%% Jacobi迭代格式的求解时间及结果绘图
u = Jacobi(10);
surf(u);

%% Gauss-Seidel 迭代格式的求解时间及结果绘图
u = GSiter(10);
surf(u);

%% 超松弛迭代的Gauss-Seidel法的求解时间及结果绘图
u = GSiterSOR(10,1.5);
surf(u);

%% 块Gauss-Seidel 迭代格式的迭代时间及结果绘图
u = GSBlockIter(10);
surf(u);

%% 块超松弛迭代解法 的迭代时间及其结果绘图
u = GSBSORiter(10,1.5);
surf(u)

%% 共轭斜量法 的运行时间及其结果绘图
tic
U = GCsolve(AA,f);
toc
u = reshape(U,n,n)+v;
surf(u);

%% 预条件的共轭斜量法
tic
U = PGCsolve(AA,f);
toc
u = reshape(U,n,n)+v;
surf(u);
