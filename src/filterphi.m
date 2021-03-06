function [fx, gx, Gx, fxx] = filterphi(x, phi)
% the fucntion handle of digital filter fucntion
% Call : [fx, gx, Gx, fxx] = filterphi(x, phi)
%
% Input: 
%       x : the value of x
%       phi: the value of frequency
%
% Output: 
%       fx: the abs value of error function of digital filter function in x and
%              frequecy phi
%       gx: the gradient of function of digital filter function in x and
%              frequecy phi
%        Gx: the Hessian Matrix of function of digital filter function in x and
%              frequecy phi
%        fxx : the value of error functionof digital filter function in x and
%              frequecy phi
n = size(x, 1);
K = (n - 1) / 4;
thet = pi * phi;
fx = 1;
N = zeros(1, K);
D = zeros(1, K);
S = abs(1 - 2 * phi);
for i = 1: K
    N(i) = (1 + x(4 * (i-1) + 1)^2 + x(4 * (i - 1) + 2)^2  + 2 * x( 4 * (i-1) + 2 ) * ( 2 * cos(thet)^2 - 1 ) + 2 * x( 4 * (i-1) + 1 ) * ( 1 + x( 4 * (i - 1) + 2 )) * cos(thet)  )^(0.5);
    D(i) = (1 + x(4 * (i-1) + 3)^2 + x(4 * (i - 1) + 4)^2  + 2 * x( 4 * (i-1) + 4 ) * ( 2 * cos(thet)^2 - 1 ) + 2 * x( 4 * (i-1) + 3 ) * ( 1 + x( 4 * (i - 1) + 4 )) * cos(thet)  )^(0.5);
    fx = fx * N(i)/D(i);
end
fx = fx * x(n);
gx = zeros(n ,1);
for i = 1 : K
    gx( 4 * (i - 1) + 1 ) = fx / ((N(i))^2) * ( x( 4 * (i -1) + 1 ) + ( 1 + x( 4 * (i-1) + 2 ) ) * cos(thet) );
    gx( 4 * (i - 1) + 2 ) = fx / ((N(i))^2) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 1 ) * cos(thet) + x( 4 * (i-1) + 2 ) );
    gx( 4 * (i - 1) + 3 ) =-fx / ((D(i))^2) * ( x( 4 * (i - 1) + 3 ) + ( 1 + x( 4 * (i-1) + 4 )) * cos(thet) );
    gx( 4 * (i - 1) + 4 ) =-fx / ((D(i))^2) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 3 ) * cos(thet) + x( 4 * (i-1) + 4 ) );
end
gx(n) = fx/x(n);
Gx = zeros(n ,n);
for i = 1 : K
    for j = 1 : K
        if j ==i
            Gx( 4 * ( i -1) + 1, 4 * (i -1) + 1 ) =  fx / ((N(i))^4) * (sin(thet)^2 * ( 1- x( 4 * (i-1) + 2) )^2 );
            Gx( 4 * ( i -1) + 1, 4 * (i-1) + 2) = fx / ((N(i))^4) * ( x( 4 * (i-1) + 1 ) * (cos(thet) + 1) + sin(thet)^2 * ( 2 * cos(thet) - 2 * x( 4 * (i -1) + 2 ) * cos(thet) - x(4 * (i-1) + 1) * x(4 *(i-1) + 2) ) );
            Gx( 4 * ( i -1) + 1, 4 * (i-1) + 3) = -fx / ((N(i))^2 * (D(i))^2) * ( x(4 * (i-1) + 1) + ( 1 + x( 4 * (i-1) + 2 ) ) * cos(thet) ) * ( x( 4 * (i - 1) + 3 ) + ( 1 + x( 4 * (i-1) + 4 )) * cos(thet) );
            Gx( 4 * (i - 1) + 1, 4 * (i-1) + 4) = -fx / ((N(i))^2 * (D(i))^2) * ( x(4 * (i-1) + 1) + ( 1 + x( 4 * (i-1) + 2 ) ) * cos(thet) ) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 3 ) * cos(thet) + x( 4 * (i-1) + 4 ) );
            Gx( 4 * (i - 1) + 2, 4 * (i-1) + 2) = fx / ((N(i))^4) * ( x( 4 * (i - 1) + 1 ) + 2 * cos( thet) )^2 * sin(thet)^2;
            Gx( 4 * (i - 1) + 2, 4 * (i-1) + 3) = -fx / ((N(i))^2 * (D(i))^2) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 1 ) * cos(thet) + x( 4 * (i-1) + 2 ) ) * ( x( 4 * (i - 1) + 3 ) + ( 1 + x( 4 * (i-1) + 4 )) * cos(thet) );
            Gx( 4 * (i - 1) + 2, 4 * (i-1) + 4) = -fx / ((N(i))^2 * (D(i))^2) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 1 ) * cos(thet) + x( 4 * (i-1) + 2 ) ) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 3 ) * cos(thet) + x( 4 * (i-1) + 4 ) );
            Gx( 4 * (i - 1) + 3, 4 * (i-1) + 3) =  fx / ((D(i))^4) * ( 2 * (x( 4 * (i -1) + 3) + (1 + x(4 * (i-1) + 4)) * cos(thet) )^2 - (1 - x( 4 * ( i -1) + 4 ) )^2 * sin(thet)^2 );
            Gx( 4 * (i - 1) + 3, 4 * (i-1) + 4) = -fx / ((D(i))^4) * (4 * cos(thet) - 5 * x( 4 * (i-1) + 3)^2 * cos(thet) + 3 * x( 4 * (i-1) + 3) - 10 * x( 4 * (i-1) + 3) * cos(thet)^2 - 2 * x( 4 * (i-1) + 4) * cos(thet) - 2 * x( 4 * (i-1) + 4)^2 * cos(thet) - 2 * x( 4 * (i-1) + 4) * cos(thet)^3 - 6 * cos(thet)^3 + 2 * x( 4 * (i-1) + 3) * x( 4 * (i-1) + 4) * cos(thet) - 3 * x( 4 * (i-1) + 3) * x( 4 * (i-1) + 4) - 6 * x( 4 * (i-1) + 3) * x( 4 * (i-1) + 4) * cos(thet)^2);
            Gx( 4 * (i - 1) + 4, 4 * (i-1) + 4) = fx / ((D(i))^4) * ( 3 * ( - 1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 3) * cos(thet) + x(4 * (i-1) + 4) )^2 - D(i)^2 );
        elseif j > i
            Gx( 4 * ( i -1) + 1, 4 * (j -1) + 1 )  = fx /(N(i)^2 * N(j)^2) * ( x( 4 * (i -1) + 1 ) + ( 1 + x( 4 * (i-1) + 2 ) ) * cos(thet) ) * ( x( 4 * (j -1) + 1 ) + ( 1 + x( 4 * (j-1) + 2 ) ) * cos(thet) );
            Gx(4 * ( i -1) + 1, 4 * (j-1) + 2 ) = fx /(N(i)^2 * N(j)^2) * ( x( 4 * (i -1) + 1 ) + ( 1 + x( 4 * (i-1) + 2 ) ) * cos(thet) ) * ( -1 + 2 * cos(thet)^2 + x( 4 * (j-1) + 1 ) * cos(thet) + x( 4 * (j-1) + 2 ) );
            Gx( 4 * ( i -1) + 1, 4 * (j-1) + 3) = -fx / ((N(i))^2 * (D(j))^2) * ( x(4 * (i-1) + 1) + ( 1 + x( 4 * (i-1) + 2 ) ) * cos(thet) ) * ( x( 4 * (j - 1) + 3 ) + ( 1 + x( 4 * (j-1) + 4 )) * cos(thet) );
            Gx( 4 * (i - 1) + 1, 4 * (j-1) + 4) = -fx / ((N(i))^2 * (D(j))^2) * ( x(4 * (i-1) + 1) + ( 1 + x( 4 * (i-1) + 2 ) ) * cos(thet) ) * ( -1 + 2 * cos(thet)^2 + x( 4 * (j-1) + 3 ) * cos(thet) + x( 4 * (j-1) + 4 ) );
            Gx( 4 * (i - 1) + 2, 4 * (j-1) + 1) = fx / (N(i)^2 * N(j)^2) * ( x( 4 * (j -1) + 1 ) + ( 1 + x( 4 * (j-1) + 2 ) ) * cos(thet) ) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 1 ) * cos(thet) + x( 4 * (i-1) + 2 ) );
            Gx( 4 * (i - 1) + 2, 4 * (j-1) + 2) = fx /(N(i)^2 * N(j)^2) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 1 ) * cos(thet) + x( 4 * (i-1) + 2 ) ) * ( -1 + 2 * cos(thet)^2 + x( 4 * (j-1) + 1 ) * cos(thet) + x( 4 * (j-1) + 2 ) );
            Gx( 4 * (i - 1) + 2, 4 * (j-1) + 3) = -fx / ((N(i))^2 * (D(j))^2) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 1 ) * cos(thet) + x( 4 * (i-1) + 2 ) ) * ( x( 4 * (j - 1) + 3 ) + ( 1 + x( 4 * (j-1) + 4 )) * cos(thet) );
            Gx( 4 * (i - 1) + 2, 4 * (j-1) + 4) = -fx / ((N(i))^2 * (D(j))^2) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 1 ) * cos(thet) + x( 4 * (i-1) + 2 ) ) * ( -1 + 2 * cos(thet)^2 + x( 4 * (j-1) + 3 ) * cos(thet) + x( 4 * (j-1) + 4 ) );
            Gx( 4 * (i - 1) + 3, 4 * (j-1) + 1) = -fx / ((N(j))^2 * (D(i))^2) * ( x(4 * (j-1) + 1) + ( 1 + x( 4 * (j-1) + 2 ) ) * cos(thet) ) * ( x( 4 * (i - 1) + 3 ) + ( 1 + x( 4 * (i-1) + 4 )) * cos(thet) );
            Gx( 4 * (i - 1) + 3, 4 * (j-1) + 2) = -fx / ((N(j))^2 * (D(i))^2) * ( -1 + 2 * cos(thet)^2 + x( 4 * (j-1) + 1 ) * cos(thet) + x( 4 * (j-1) + 2 ) ) * ( x( 4 * (i - 1) + 3 ) + ( 1 + x( 4 * (i-1) + 4 )) * cos(thet) );
            Gx( 4 * (i - 1) + 3, 4 * (j-1) + 3) = fx / ((D(i))^2 * (D(j))^2) * ( x( 4 * (i - 1) + 3 ) + ( 1 + x( 4 * (i-1) + 4 )) * cos(thet) ) * ( x( 4 * (j - 1) + 3 ) + ( 1 + x( 4 * (j-1) + 4 )) * cos(thet) );
            Gx( 4 * (i - 1) + 3, 4 * (j-1) + 4) = fx /  ((D(i))^2 * (D(j))^2) * ( x( 4 * (i - 1) + 3 ) + ( 1 + x( 4 * (i-1) + 4 )) * cos(thet) ) * ( -1 + 2 * cos(thet)^2 + x( 4 * (j-1) + 3 ) * cos(thet) + x( 4 * (j-1) + 4 ) );
            Gx( 4 * (i - 1) + 4, 4 * (j-1) + 1) = -fx / ((N(j))^2 * (D(i))^2) * ( x(4 * (j-1) + 1) + ( 1 + x( 4 * (j-1) + 2 ) ) * cos(thet) ) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 3 ) * cos(thet) + x( 4 * (i-1) + 4 ) );
            Gx( 4 * (i - 1) + 4, 4 * (j-1) + 2) =  -fx / ((N(j))^2 * (D(i))^2) * ( -1 + 2 * cos(thet)^2 + x( 4 * (j-1) + 1 ) * cos(thet) + x( 4 * (j-1) + 2 ) ) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 3 ) * cos(thet) + x( 4 * (i-1) + 4 ) );
            Gx( 4 * (i - 1) + 4, 4 * (j-1) + 3) = fx /  ((D(i))^2 * (D(j))^2) * ( x( 4 * (j - 1) + 3 ) + ( 1 + x( 4 * (j-1) + 4 )) * cos(thet) ) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 3 ) * cos(thet) + x( 4 * (i-1) + 4 ) );
            Gx( 4 * (i - 1) + 4, 4 * (j-1) + 4) = fx /  ((D(i))^2 * (D(j))^2) * ( -1 + 2 * cos(thet)^2 + x( 4 * (i-1) + 3 ) * cos(thet) + x( 4 * (i-1) + 4 ) ) * ( -1 + 2 * cos(thet)^2 + x( 4 * (j-1) + 3 ) * cos(thet) + x( 4 * (j-1) + 4 ) );
        end
    end
end
for i = 1 : K
    Gx(4 * (i-1) + 1, n) = gx(4 * (i-1) + 1) / x(n);
    Gx(4 * (i-1) + 2, n) = gx(4 * (i-1) + 2) / x(n);
    Gx(4 * (i-1) + 3, n) = gx(4 * (i-1) + 3) / x(n);
    Gx(4 * (i-1) + 4, n) = gx(4 * (i-1) + 4) / x(n);
end
Gx(n ,n) = 0;
for i = 1 : n
    for j = 1: n 
        if j < i
            Gx(i, j) = Gx(j, i);
        end
    end
end
fxx = fx - S;
gx = sign(fx - S) * gx;
fx = abs(fx - S);
end