function [f, g, G] = RosenSuzukif4(x)
alph = 10;
[Ff, Fg, FG] = RosenSuzukiF(x);
[gf, gg, gG] = RosenSuzukig4(x);
f = Ff - alph * gf;
g = Ff - alph * gg;
G = FG - alph * gG;
end
