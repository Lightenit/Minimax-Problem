function  [x, u, xi, feval_nu, error, fstar] = GetUOptimal(Objf, x0, u, pp, xi, lambd)
fun = @(x)U(x , Objf, u, pp, xi);
U(x0, Objf, u, 10, 0)
x = fminsearch(fun, x0);
fstar = feval(@U, x, Objf, u, pp, xi);
[u, new_xi] = updateUxi(Objf, x, u, pp, xi, lambd);
error = abs(new_xi - xi);
xi = new_xi;
feval_nu = 3;
end