function x = LeastSquaresFittingFunction()
clc;
% 求解函数的最小二乘拟合函数

% 列表函数的最小二乘多项式拟合
variables = [1,3,4,5,6,7,8,9,10];% matlab 计数从 1 开始
values = [2,7,8,10,11,11,10,9,8];

% 用户输入所需的最小二乘拟合多项式的次数
degree = input('请输入所需的最小二乘拟合多项式的次数：');

% 计算系数矩阵
max_power = 2*degree; % 需要计算到 2*degree 次幂
S = zeros(1, max_power + 1); % S(1)=x^0的和, S(2)=x^1的和,...S(max_power+1)=x^max_power的和
for k = 0: max_power
    S(k+1) = sum(variables.^k);
end

A = sym(zeros(degree + 1));
for row = 1:degree + 1
    for col = 1:degree + 1
        power = (row-1) + (col-1);   % 计算数组A中的索引位置
        A(row, col) = S(power + 1);
    end
end

% 计算右侧向量
b = sym(zeros(degree + 1, 1));
for k = 0:degree
    b(k+1) = sum(values .* variables.^k); % 点乘直接计算内积
end

disp(S);
disp(b);

x = A \ b;              % 使用符号运算求解
disp(x);               % 结果会以分数形式显示

y = double(x); % 转化成小数
disp(y);