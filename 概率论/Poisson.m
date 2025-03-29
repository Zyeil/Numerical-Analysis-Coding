% 利用 Poisson 分布估算二项分布

clc;% 清除命令窗口

% give the parameters of binomial distribution
n = 1200;
p = 0.05;
q = 1 - p;
lambda = n * p;

P = zeros(1,n);% initialize a vector

% give value for the probability
for k = 1:n
    P(1,k) = exp(-lambda) * lambda^k / factorial(k);
end

S = zeros(1,n);
for k = 1:1200
    S(k) = sum(P(1:k));
end

disp(S(10));