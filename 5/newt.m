function x = newt(fv,x0,n)
% a=1,b=2,fv = {'x^4 - 1', 'sin(x)-1 + cos(x)'},n=100,  x0=1
    % newt('sin(x)-2*x-3', 5, 64)
    % A fv bemenő paramétert karakteres tömbben kell megadni különben:
    % Argument must be string, character vector, or cell array of character vectors.
    % Error in newt (line 14)
    % fv_sym = str2sym(f)
    % n - lépésszám
    % x0 -kiinduló érték
    % TFH.: f′(x) != 0 és x0  R, akkor: 
    % xn+1​=xn​−f′(xn​) / f(xn​)
    
    % FONTOS!!
    % Ahhoz hogy a syms x működjön telepíteni kell a 
    % Symbolic Math Toolbox-ot (bővítmény)

    syms x;
    fv_sym = str2sym(fv); % Szimbolikus kifejezés
    derivalt = diff(fv_sym, x);
    x = x0;
    for k = 1:n
        x = x - double(subs(fv_sym, x) / subs(derivalt, x));
    end
end