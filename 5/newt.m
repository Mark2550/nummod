function x = newt(fv,x0,a,b,n,pontossag)
% a=1,b=2
% fv = @(x)x^3-2*x-1
% n=100, pontossag=1e-6

    % [a,b] - intervallum
    % n - lépésszám
    % x0 -kiinduló érték
    % TFH.: f′(x) != 0 és x0  R, akkor: 
    % xn+1​=xn​−f′(xn​) / f(xn​)
    
    syms x;
    % FONTOS!!
    % Ahhoz hogy a syms x működjön telepíteni kell a 
    % Symbolic Math Toolbox-ot (bővítmény)

    if(fv(x0) * diff(diff(x0)) <= 0)
        error("A monoton konvergencia tétele nem teljesül!");
    end

    if(x0 <= a && x0 >= b) %x0 nincs az intervallumban
        error("x0 nincs az intervallumban!");
    end
    
    derivalt = diff(fv, x);
    for k=1:n
        fvX = fv(x0);    % a fv értéke a kezdőpontban
        dfX = derivalt(x0);  % x0 deriváltjának értéke

        x1 = x0 - fvX / dfX;

        if x1-x0 < pontossag
            x = x1;
            disp(['Iterációk száma: ', k]);
            return;
        end

        x0 = x1;
    end
