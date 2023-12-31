function l = lagrange(x,y,xq)
% l = lagrange(x,y,xq)
%
%   Implementa in modo vettoriale la forma di lagrange del polinomio
%   interpolante di una funzione 
%
%   Input:
%       x:  ascisse di interpolazione 
%       y:  valori della funzione sulle ascisse di interpolazione
%       xq: punti in cui calcolare il polinomio
%   Output:
%       l:  polinomio di lagrange calcolato

n = length(x);
if n ~= length(y)
    error("il numero di punti sulle ascisse x non è coerente con" + ...
        " il numero di quelli sulle ordinate");
end
if n ~= length(unique(x))
    error("ad una stessa ascissa non possono corrispondere più punti")
end
l = zeros(size(xq));
for k = 1:n
    Lkn = ones(size(xq));
    for j = 1:n
        if k ~= j
            Lkn = Lkn .* ((xq - x(j))/(x(k) - x(j)));
        end
    end
    l = l + y(k)*Lkn;
end
return;
end
