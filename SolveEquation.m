clc;
A = sym([1,1/2; 1/2,1/3]);
b = sym([2/3, 5/2]);

x = A \ b';
disp(x);