function [exit_code, xstar, fstar, feval_num, iter_num] = adasmooth(Objf, p, epsilon, pm)
q = size(Objf, 2);
iter_num =0;
feval_num  = 1;
error = 1;
x = p;
fx= calf(Objf, x, 1/pm);
gx = calg(Objf, x, 1/pm);
Gx = calHe(Objf, x, 1/pm);
tao = 1e-2;
phat = log(q/epsilon);
gamm = 1;
ea = 0.001;
eb = 0.02;
k = 0;
k1 = 1e-7;
k2 = 1e30;
k3 = 1000 * phat;
while error > epsilon
%    d = - gx / Gx;
%% Stabilized Newton
    [MG, pd_flag] = Cholesky_Revise(Gx, 1);
    Cond_MG = 1/cond(MG);
    if pd_flag > 0.5 && Cond_MG >= k1 && pm <= k3
%         d = -gx / MG;
        d = - inv(MG) * gx;
    elseif pd_flag > 0.5 && max(eigen(MG)) <= k2
%         d = -gx / MG;
        d = -inv(MG) * gx;
    else
        d = -gx;
    end
    
%% Armijo
%     d =  - (Gx + 1e-6 * eye(size(x, 1))) \ gx;
    [stepsize, feval_nu] = ArmijoRule(Objf, x, d, 5, 0.5^0.5, 0.1, 1/pm);
    x = x + stepsize * d;
    nfx = calf(Objf, x, 1/pm);
    gx = calg(Objf, x, 1/pm);
    Gx = calHe(Objf, x, 1/pm);
    error = abs(nfx - fx);
    fx = nfx;
    iter_num = iter_num + 1;
    feval_num  = feval_num  + feval_nu;
    if norm(gx)^2 <= tao
        pstar = findpstar(Objf, x, ea, eb);
        k = k + 1;
        if pstar <= phat
            pm = max(pstar, pm + 1);
        elseif gamm == 1
            gamm = max(2, (phat + 2)/(k + 1));
            pm = gamm * (k + 2);
        else
            pm = gamm * (k + 2);
            k = k + 1;
        end
    end
end
maxf = -10000;
for i = 1: q
    if feval(Objf{i}, x) > maxf
        maxf = feval(Objf{i}, x);
    end
end
xstar = x;
fstar = maxf;
exit_code = 1;

end
