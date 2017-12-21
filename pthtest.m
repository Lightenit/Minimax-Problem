% p = [1, -0.1]';
% Objf = cell(1 ,3);
% Objf{1} = @xu21;
% Objf{2} = @xu22;
% Objf{3} = @xu23;
% epsilon = 1e-6;
% [exit_code, xstar, fstar, feval_num, iter_num] = leastpth(Objf, p, epsilon)

p = [0, 1, 2 , -1]';
Objf = cell(1, 4);
Objf{1} = @RosenSuzukiF;
Objf{2} = @RosenSuzukif2;
Objf{3} = @RosenSuzukif3;
Objf{4} = @RosenSuzukif4;
epsilon = 1e-10;
[exit_code, xstar, fstar, feval_num, iter_num] = leastpth(Objf, p, epsilon)