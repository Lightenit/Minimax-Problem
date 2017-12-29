p = [1, -0.1]';
Objf = cell(1 ,3);
Objf{1} = @xu21;
Objf{2} = @xu22;
Objf{3} = @xu23;
epsilon = 1e-10;
mu = 10000;
[exit_code, xstar, fstar, feval_num, iter_num] = adasmooth(Objf, p, epsilon, 1/mu)

% p = [0, 0, 0 , 0]';
% Objf = cell(1, 4);
% Objf{1} = @RosenSuzukiF;
% Objf{2} = @RosenSuzukif2;
% Objf{3} = @RosenSuzukif3;
% Objf{4} = @RosenSuzukif4;
% epsilon = 1e-10;
% bet = 0.5;
% mu = 100;
% [exit_code, xstar, fstar, feval_num, iter_num] = adasmooth(Objf, p, epsilon, 1/mu)
% fstar + 44