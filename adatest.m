p = [1, -0.1]';
Objf = cell(1 ,3);
Objf{1} = @xu21;
Objf{2} = @xu22;
Objf{3} = @xu23;
epsilon = 1e-6;
mu = 10000;
[exit_code, xstar, fstar, feval_num, iter_num] = adasmooth(Objf, p, epsilon, 1/mu)