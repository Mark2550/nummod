function interp = newtonip(x,y,p)
    % x,y: interpoláció alappontjai és a fv.értékek az alappontokban
    % p: kiértékelési pontok
    % interp: az interpolációs polinom Newton alakja
    % képlet: num22_05HO.pdf 16. oldala

    % x = [1 2 4 7]
    % y = [0 3 -1 2]
    % p = 5
    % eredmény = 2
    n = length(x);
    f = zeros(n, n); % Newton együtthatók táblázata
    f(:,1) = y;
    
    % Newton együtthatók meghatározása:
    for k=2:n
        for l=k:n
            f(k,l) = (f(l,k-1) - f(l-1,k-1)) / (x(l) - x(l-k+1));
        end
    end
    
    % Kiértékelés:
    interp = f(1,1);
    for k = 2:n
        
        temp = f(k,k);
        for l = 1:k-1
    
            temp = temp*(p-x(l));
        end
        interp = interp+temp;
    end
    disp(['Az eredmény: ' ,num2str(interp)]);
    folytatas = input('Szeretne új alappontot hozzáadni? (1 - igen, 2 - nem)\n');

    while(folytatas == 1)
        xc = input('Adja meg az új alappontot (x): ');
        yc =  input('Adja meg a függvényértéket az alappontban (y): ');
        pc = input('Adja meg az új kiértékelése pontot (p): ');
        if ( isempty(xc) || isempty(yc) || isempty(pc) )
            error('Egy mezőt üresen hagyott!');
        end
        x = [x,xc];
        y = [y,yc];
        newtonip(x,y,p)
    end
end


