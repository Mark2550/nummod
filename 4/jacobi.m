function x = jacobi(A,b, maxLepes)


%A=[5 -2 3 0;-3 9 1 -2;2 -1 -7 1; 4 3 -5 7]
%b=[-1 2 3 0.5]'
%x=[0 0 0 0]'

% Kiegészítés (1): max iterációk száma (maxLepes)
% adjuk meg a hibakorlátot
% program számolja a szükséges lépésszámot

% EGYÉNI: a feladatot úgy értelmeztem h a program adja meg a hibakorlátot
% Az "optimális" hibakorlát 1e-6 (1x10^-6)

% Kieg. (2) Ellenőrizzük a szükséges és elégséges feltétel teljesülését,
% de hibabecslést csak akkor végezzük, ha a 4 jólismert mátrixnorma valame-
% lyikére teljesül az elégséges feltétel.


% A: egyenletrendszer mátrixa, b: jobboldalvektor
% x: megoldásvektor megfelelő közelítése
% Az x(k+1) előállítása során x(k)-t végig meg kell őriznünk


n = length(b);
x = zeros(n,1);
x_old = x;
hibakorlat = 1e-6;

% Feltételek:
% 1. Mátrix diagonálisan domináns legyen, ez biztosítja a konvergenciát
% 2. Az iterációs mátrix spektrálsugara kisebb mint 1
% 3. A mátrix négyzetes
% 4. Az ER konzisztens és egyértelmű megoldással rendelkezik
% Szükséges: A mátrix négyzetes legyen

    [m, ~] = size(A);
    if m ~= n
        error('A mátrixnak négyzetesnek kell lennie!');
    end

% Metódus

for k=1:maxLepes
     for i = 1:n        % Szigma számolása
            sigma = A(i, :) * x_old - A(i, i) * x_old(i);
            x(i) = (b(i) - sigma) / A(i, i);
     end
     if norm(x - x_old, inf) < hibakorlat
            disp(['Az iteráció ' num2str(k) ' lépésben'])
            break;
     end

     x_old = x;

     % Az iteráció addig megy, amíg a 2 egymást követő iteráció közötti 
     % változás normája kisebb, mint a hibakorlát

     if(k == maxLepes)
        disp("Az iterációk száma elérte a maximális lépésszámot!");
     end
end





