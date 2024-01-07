function x = gaussseid(A,b, maxLepes)

%A=[5 -2 3 0;-3 9 1 -2;2 -1 -7 1; 4 3 -5 7]
%b=[-1 2 3 0.5]

n = length(b);
x = zeros(n,1);
hibakorlat = 1e-6;

% A mátrixot LDU-ra kell felbontani
L = tril(A, -1);
D = diag(diag(A));
U = triu(A, 1);

for k = 1:maxLepes
        x_old = x;
        % X felülírható (nincs szükség rá az x^i+1 számolásához
        % (num03_23HO.pdf)

        x = (D + L) \ (-U * x + b);
        if norm(x - x_old, inf) < hibakorlat
            disp(['Az iteráció ' num2str(k) ' lépésben'])
            break;
        end
end