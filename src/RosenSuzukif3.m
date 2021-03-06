function [f, g, G] = RosenSuzukif3(x)
% The function handle of RosenSuzuki F_3
alph = 10;
[Ff, Fg, FG] = RosenSuzukiF(x);
[gf, gg, gG] = RosenSuzukig3(x);
f = Ff - alph * gf;
g = Fg - alph * gg;
G = FG - alph * gG;
end
