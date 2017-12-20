function pstar = findpstar(Objf, x, ea, eb)
for i = 1: 10000
    gx = calg(Objf, x, 1/i);
    gxnorm = norm(gx)^2;
    if gxnorm >= ea && gxnorm <= eb
        break
    end
end
pstar = i;
end