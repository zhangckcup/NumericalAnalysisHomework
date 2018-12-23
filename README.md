# NumericalAnalysisHomework
数值分析大作业，解线性方程组的直接法与迭代法，并使用五点差分法解Possion方程

test1.m 	使用直接法解决此问题的测试文件

直接法包括：

LUsolve		LU分解方法

	LUdeco/LUdeco2	为其子文件/修改后的方法

GaussElim	高斯消元法

ChlskSolve	Cholesky分解法解线性方程组

test2.m 	使用迭代法解决此问题的测试文件

迭代法包括：

Jacobi		Jacobi 迭代格式解此问题

GSiter		Gauss-Seidel 迭代格式

GSiterSOR	超松弛迭代的Gauss-Seidel法

GSBlockIter	Gauss-Seidel 块迭代格式

	symzg.m 为其子文件，追赶法解对称的三对角线性方程组

GSBSORiter	块超松弛迭代解法，调用symzg

GCsolve		共轭斜量法求解线性方程组

PGCsolve	预条件的共轭斜量法求解

	调用了 LUsolve 函数求解 MZ=r
