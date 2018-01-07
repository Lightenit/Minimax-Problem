function [f, g, G] = RosenSuzukif4(x)
% The function handle of RosenSuzuki F_4
alph = 10;
[Ff, Fg, FG] = RosenSuzukiF(x);
[gf, gg, gG] = RosenSuzukig4(x);
f = Ff - alph * gf;
g = Fg - alph * gg;
G = FG - alph * gG;
end
