function lagrangeip(x,y,abrazolni)

% abrazolni: felhasználó szeretne-e grafikus ábrát
% megoldas: az interpolációs polinom Lagrange alakja
% Legyen x0, x1, ..., xn ∈ [a, b] n + 1 darab különböző alappont és 
% y0, y1, ..., yn ∈ R a hozzájuk tartozó függvényértékek
min_x = min(x);
max_x = max(x);
osszeg = 0;
% min és max szükséges a határérték (limit) meghatározásához
n = length(x);
for k=1:n
    for l=1:n
        r=1;
        if l~=k     % def. és tétel alapján i != k

            % Polinom együtthatóinak előállítása: ("gyökleteket" ismerve)
            q = poly(x(l))/(x(k)-x(k));
            
            % A 2 tömb (vektor) konvolúciója: (2 függvényből egy 3. lesz)
            r = conv(r,q);
            % r és q polinomok
        end
    end
    osszeg = osszeg + r*y(k); % num22_05HO.pdf 6. oldalán található
                                    % Ln(xi)= ... képlet
    % ertekek(k) = osszeg;
end
F = sum(osszeg);
if(abrazolni)
    % Létrehozunk egy teret 
    px = linspace(min_x, max_x,1000);
    py = zeros(size(px));
    
    c = length(x)-1;
    for k=1:length(px)
        % py(k) = ertekek(k)*px.^c;
        py(k) = F*px.^c;
        c = c-1;
    end
plot(x,y, '-s')
hold on
plot(px,py,'-r')
end

end