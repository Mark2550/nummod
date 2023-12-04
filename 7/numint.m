function integral_result = numint(integrand,a,b,n,type)
% Bemenő paraméterek: az integrandus (stringként)
% az intervallum végpontjai (a, b), az osztópontok száma (n)
% kvadratúra formula típusa(téglalap, trapéz, simpson)

% numint('x^2+2*x', 1, 7, 15, 'téglalap')

% bemenő string konvertálása fv.-é: 
% (ezt később használjuk a behelyettesítésnél)
f = str2func(['@(x) ' integrand]);


% Típus ellenőrzése switch-case-el
switch type
    case 'trapéz'
        integral_result = trapez(a,b);
        disp(['Eredmény (trapéz szabály): ', num2str(integral_result)]);
    case 'simpson'
        integral_result = simpson(f,a,b,n);
        disp(['Eredmény (simpson szabály): ', num2str(integral_result)]);
    case 'téglalap'
        integral_result = teglalap(a,b);
        disp(['Eredmény (téglalap szabály): ', num2str(integral_result)]);
    otherwise 
        error('Érvénytelen típus!');
end

function integral_result = teglalap(a,b)
    integral_result = (b-a)*f((a+b)/2);
    % Newton Cotes formula alapján
end

function integral_result = trapez(a,b)
    integral_result = (b-a)/2 * (f(a)+f(b));
    % Newton-Cotes formulák alapján Z(1)
end

function integral_result = simpson(a,b,n)
    if mod(n, 2) ~= 0
        error('Nem páros számú az osztópont!');
    end
    integral_result = (b-a)/6 * (f(a)+4*f((a+b)/2)+f(b));
end

end
