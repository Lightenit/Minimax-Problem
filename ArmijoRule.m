function [Stepsize, feval_num, step_flag] = ArmijoRule(Objf, x, d, alph, bet, ph, mu)
% Get the Stepsize of Objf in x with direction d Using ArmijoRule
% Call: [Stepsize, feval_num, step_flag] = ArmijoRule(Objf, x, d, alph, bet, ph)

% Input: 
% Objf : handle of Object Function
% x : point
% d : descent direction
% alph : parameter of ArmijoRule
% bet : parameter of ArmijoRule
% ph : parameter of ArmijoRule

% Output:
% Stepsize: stepsize
% feval_num : the number of evaluation time of Objf
% step_flag : whether get the stepsize using ArmijoRule
[exit_code, feval_num] = ArmijoTest(Objf, x, d, 1, ph);
step_flag = 0;
if exit_code > 0.5
    Stepsize = 1;
else
    exit_flag = 0;
    for i = 1:100
        [exit_code, feval_nu] = ArmijoTest(Objf, x, d, alph * bet^i, ph, mu);
        if exit_code > 0.5
            feval_num = feval_num + feval_nu;
            Stepsize = alph * bet ^ i;
            exit_flag = 1;
            break
        end
    end
    if exit_flag == 0
        Stepsize = 0.000001;
        step_flag = 1;
    end
end
end
