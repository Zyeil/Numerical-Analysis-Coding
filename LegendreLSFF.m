clc;

syms x; % 创建符号变量 x

f = sin(pi/2 * x); % 定义函数 f(x)

% 基函数为勒让德多项式
P = cell(1,4);
for k = 1:4
    P{k} = legendreP(k-1,x); % P(k) 表示 (k-1) 次勒让德多项式
end

% 定义内积函数
function result = CInnerProduct(f1, f2)
    % 假设内积是在区间 [-1, 1] 上计算的
    result = int(f1 * f2, -1, 1); % 直接使用符号积分计算内积
end

% 计算系数矩阵 (内积矩阵)
inner = zeros(4,4);
for r = 1:4
    for c = 1:4
        inner(r,c) = CInnerProduct(P{r}, P{c}); % 计算 P(r) 和 P(c) 之间的内积
    end
end

% 计算右侧向量 b
b = zeros(4, 1);
for k = 1:4
    b(k) = CInnerProduct(P{k}, f); % 计算 P(k) 和 f(x) 之间的内积
end

% 求解线性方程组
x = inner \ b; % 左除求解 x
disp(x); % 显示解

% 计算系数矩阵 (内积矩阵)
inner1 = sym(zeros(4, 4)); % 创建一个符号矩阵来存储内积结果
for r = 1:4
    for c = 1:4
        inner1(r,c) = simplify(CInnerProduct(P{r}, P{c})); % 计算 P(r) 和 P(c) 之间的内积
    end
end

% 输出矩阵的分式表达式
disp(inner1);

b1 = sym(zeros(4,1));
for k = 1:4
    b1(k) = simplify(CInnerProduct(P{k},f));
end

disp(b1);

disp(P);
disp(inner);
disp(b);
