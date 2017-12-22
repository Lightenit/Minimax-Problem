function [fx, gx, Gx] = filterphi(x, phi)
n = size(x, 1);
K = (n - 1) / 4;
thet = pi * phi;
fx = 1;
N = zeros(1, K);
D = zeros(1, K);

end