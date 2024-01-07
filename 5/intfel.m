function x = intfel(fv, a, b, n, pontossag)
% fv: a bemenő fv. (amin keressük a zérushelyet)
% a és b: intervallum 2 végpontja
% n: lépésszám
% pontosság: közelítési érték (pontossági elvárás)  
% x: gyök (ZH) megfelelő közelítése: x∗

% a következő finomítást nem végeztem el!:
% A felhasználótól eleve csak az intervallum egyik végpontját kérjük be és
% keressünk egy megfelelő végpontot.

% https://math.uni-pannon.hu/~lipovitsa/num/5.pdf

% fv = @(x) x^2 - 2, pontossag = 1e-6, a=0, b=2, n=100
% eredmény: 14142
% VAGY
% fv = @(x) cos(x);
% eredmény: 1.570796

 if (fv(a) * fv(b) > 0)     % Ha rossz az intervallum    
        error('Az intervallum(ok) nem megfelelő(ek)!');
 end
 % A tétel kimondja: Legyen f∈C[a,b] és f(a)·f(b)<0.
 % Ekkor létezik x∗∈(a, b), amelyre f(x∗)=0.

 for k = 1:n
        % Az intervallum "felének" kiszámítása:
        c = (a+b)/2;
        
        % Ha az érték a nullához közelít a megadott toleranciánktól, akkor
        % találtunk egy megoldást
        if(abs(fv(c)) < pontossag)
            x = c;
            return;
        end

        if(fv(c) * fv(a) < 0)  % Az intervallum "bal" oldala
            b = c;
        else    % Az intervallum jobb oldala (felétől b-ig)
            a = c;
        end
 end
 error('Nem sikerült az intervallum felezés, túl kevés a lépésszám!');
% c = (a*fv(b)-b*fv(a)) / (fv(b)-fv(a));
