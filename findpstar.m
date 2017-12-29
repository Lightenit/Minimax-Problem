function pstar = findpstar(Objf, x, ea, eb)
for i = 1: 10:1000000
    gx = calg(Objf, x, 1/i);
    gxnorm = norm(gx)^2;
    if gxnorm >= ea && gxnorm <= eb
        break
    end
end
pstar = i;
end