function  [x, u, xi, feval_nu, error, fstar] = GetUOptimal(Objf, x0, u, pp, xi, lambd)
% Get the optimal point of U function in least pth.
% Call : [x, u, xi, feval_nu, error, fstar] = GetUOptimal(Objf, x0, u, pp, xi, lambd)
%
% Input : 
%   Objf : The cell of Object Function
%   x0 : the initial value of x
%   pp : p value in U function
%   xi : xi value in U function
%   lambd : lambd value in U function
%   
% Output:
%    x : the optimal point of U funtion
%    u : u_i in U function
%    feval_nu : the number of feval
%    error : the error in this step
%    fstar : the value of U funtion in x
fun = @(x)U(x , Objf, u, pp, xi);
% U(x0, Objf, u, 10, 0)
x = fminsearch(fun, x0);
fstar = feval(@U, x, Objf, u, pp, xi);
[u, new_xi] = updateUxi(Objf, x, u, pp, xi, lambd);
error = abs(new_xi - xi);
xi = new_xi;
feval_nu = 3;
end