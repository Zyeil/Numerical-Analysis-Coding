clc;% 清除命令窗口

% give the parameters of binomial distribution
n = 1200;
p = 0.05;
q = 1 - p;

P = zeros(1,n);% initialize a vector

% give value for the probability
for k = 1:1200
    P(1,k) = nchoosek(n,k) * p^k * q^(n-k);
end

S = zeros(1,n);
for k = 1:10
    S(k) = sum(P(1:k));
end

disp(S(10));