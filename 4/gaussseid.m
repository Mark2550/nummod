function x = jacobi(A,b, maxLepes)

n = length(b);
x = zeros(n,1);
hibakorlat = 1e-6;

% A mátrixot LDU-ra kell felbontani
L = tril(A, -1);
D = diag(diag(A));
U = triu(A, 1);

for k = 1:maxLepes
        %x_old = x;
        
        % X felülírható (nincs szükség rá az x^i+1 számolásához
        % (num03_23HO.pdf)

        x = (D + L) \ (-U * x + b);
        if norm(x - x_old, inf) < hibakorlat
            disp(['Az iteráció ' num2str(k) ' lépésben'])
            break;
        end
end