p = [1, -0.1]';
Objf = cell(1 ,3);
Objf{1} = @xu21;
Objf{2} = @xu22;
Objf{3} = @xu23;
epsilon = 1e-6;
bet = 0.5;
mu = 100;
[exit_code, xstar, fstar, feval_num, iter_num] = xusmooth(Objf, p, epsilon, mu, bet)
fstar-2