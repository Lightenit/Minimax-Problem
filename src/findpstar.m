function pstar = findpstar(Objf, x, ea, eb)
% Find pstar in the adaptive smooth method.
% Call : pstar = findpstar(Objf, x, ea, eb)
%
% Input : 
%       Objf : The cell of Object function
%       x : the value of x
%       ea : epsilon_a
%       eb : epsilon_b
%
% Output : 
%       pstar : pstar value
for i = 1: 10:1000000
    gx = calg(Objf, x, 1/i);
    gxnorm = norm(gx)^2;
    if gxnorm >= ea && gxnorm <= eb
        break
    end
end
pstar = i;
end