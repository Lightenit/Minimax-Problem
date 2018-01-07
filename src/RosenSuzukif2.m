function [f, g, G] = RosenSuzukif2(x)
% The function handle of RosenSuzuki F_2
alph = 10;
[Ff, Fg, FG] = RosenSuzukiF(x);
[gf, gg, gG] = RosenSuzukig2(x);
f = Ff - alph * gf;
g = Fg - alph * gg;
G = FG - alph * gG;
end
