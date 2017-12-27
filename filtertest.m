pphi = zeros(41,1);
for i = 1 : 6
    pphi(i) = (i - 1) * 0.01;
end
for i = 7 : 20
    pphi(i) = 0.07 + (i - 7) * 0.03;
end
pphi(21) = 0.5;
pphi(22) = 0.54;
pphi(23) = 0.57;
pphi(24) = 0.67;
for i = 25 : 35
    pphi(i) = 0.63 + 0.03 * (i - 25);
end
for i = 36 : 41
    pphi(i) = 0.95 + 0.01 * (i - 36);
end
Objf = cell(1, 41);
for i = 1 : 41
    Objf{i} = @(x)filterphi(x, pphi(i));
end
p = [0 0.9990  0  -0.15  0  -0.68  0  -0.72  0.37]';
epsilon = 1e-10;
[exit_code, xstar, fstar, feval_num, iter_num] = leastpth(Objf, p, epsilon)
% epsilon = 1e-6;
% bet = 0.5;
% mu = 100;
% [exit_code, xstar, fstar, feval_num, iter_num] = xusmooth(Objf, p, epsilon, mu, bet)
% epsilon = 1e-6;
% bet = 0.5;
% mu = 100;
% [exit_code, xstar, fstar, feval_num, iter_num] = adasmooth(Objf, p, epsilon, 1/mu)