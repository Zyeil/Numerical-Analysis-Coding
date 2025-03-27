clc;
n = 3; % 选择 Legendre 多项式的阶数
x = linspace(-1, 1, 100); % 计算在 [-1, 1] 区间的多项式值
P_n = legendre(n, x); % 计算 n 阶 Legendre 多项式
plot(x, P_n(1, :)); % 画出 3 阶 Legendre 多项式
title('3rd Order Legendre Polynomial');
xlabel('x');
ylabel('P_3(x)');

% 数据点
x_data = [-1, -0.5, 0, 0.5, 1]; 
y_data = [1, 2, 0, -1, 1]; 

% 选择多项式的阶数
degree = 3;

% 计算基函数矩阵（Legendre 多项式）
X = zeros(length(x_data), degree+1); % 初始化设计矩阵
for i = 1:length(x_data)
    for j = 0:degree
        X(i, j+1) = legendre(j, x_data(i)); % 计算 Legendre 多项式的值
    end
end

% 使用最小二乘法求解系数
coeff = X \ y_data'; % 求解最小二乘问题 X * coeff = y_data

% 显示结果
disp('Legendre Polynomial Coefficients:');
disp(coeff);

% 计算拟合结果
y_fit = X * coeff;

% 绘制结果
plot(x_data, y_data, 'o', x_data, y_fit, '-');
legend('Data', 'Fitted Curve');
title('Least Squares Approximation Using Legendre Polynomials');
