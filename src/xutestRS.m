p = [0, 0, 0 , 0]';
Objf = cell(1, 4);
Objf{1} = @RosenSuzukiF;
Objf{2} = @RosenSuzukif2;
Objf{3} = @RosenSuzukif3;
Objf{4} = @RosenSuzukif4;
epsilon = 1e-10;
bet = 0.5;
mu = 100;
[exit_code, xstar, fstar, feval_num, iter_num] = xusmooth(Objf, p, epsilon, mu, bet)
xstar-[0,1,2,-1]'
fstar+44