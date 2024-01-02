function x = gaussel1_3(A,b)

%   A = [ 1 2 -1;2 -1 3;-1 3 1 ]
%   b = [4;3;6]

% A - egyenletrendszer mátrixa,
% b - jobboldal vektor
% x - megoldásvektor
% Li és LU-t nem kell számolni!
% ---------------------------- 1. feladat ---------------------------------

n = max(size(A));       % Mátrix rangja
% A GE négyzetes mátrix esetén hajtható vége ÉS a mátrix sora meg kell
% egyezzen a b vektor sorainak számával:

if size(A,1) ~= size(b,1) || size(b,2) ~= 1
    error("'A' és 'b' dimenziói nem egyeznek meg!")
end

% Ha a mátrix alulhatározott:

if size(A,1) < size(A,2)
    warning("A mátrix alulhatározott!");
    format rat; % tört alakban való kiíratás
    x = pinv(A)*b;      % pinv(A) mátrix inverze olyan esetben mikor a hagyományos inverz nem segít (chatgpt :D)
    return
end

% Túlhatározott: Ha több "oszlop" van mint sor; több "információt" hordozw
% x + y = 2
% 2x + 2y = 4
% 3x + 3y = 6
% A(k, :): adott sor egész oszlopára hivatkozunk

if size(A, 1) > size(A,2)
    x = A\b;
    error("A mátrix túlhatározott!");
end
    
% Hibaüzenet ha nem hajtható végre sor és oszlopcsere nékül:
% Gauss elimináció:

% Elimináció közbülső mátrixa (kérésre, A^(i)):
reszletek = input("Szeretné kiiratni a küzbülső mátrixot?");

for k=1:n
    for l=k+1:n
        if(A(k,k) == 0)
            error("A GE nem hajtható végre sor és oszlopcsere nélkül!")
        end
        % Ha a főátlóbeli elemek mind 0 abban az esetben van szükség
        % sor/oszlop cserére

        m =  A(l,k)/A(k,k);     % Osztó/szorzó hogy kinullázzuk az elemeket
        A(l,:) = A(l,:) - A(k,:)*m;     % Főátló alatti elemek nullázása
        b(l) = b(l) - b(k)*m;
        % Közbülső mátrix kiiratása:

        % if(reszletek == 'y' || reszletek == "igen" || reszletek == 'i')
        % Comparison between double and string is not supported. :))))))

        % Inkább megkötöm a felhasználót
        if(reszletek == 1)
            disp("Közbülső mátrix:")
            disp(A)
        end
    end
end

% Eredmények, x feltöltése: 

x = zeros(n,1);
x(n) = b(n)/A(n,n);
for k=n-1:-1:1
    x(k) = (b(k)-A(k,k+1:n)*x(k+1:n))/A(k,k);
end
% ---------------------------- 1. feladat vége ----------------------------

% ---------------------------- 3. feladat kezdete -------------------------
A_inv = inv(A);
det_A = det(A);
disp("A mátrix inverze: ")
disp(A_inv)
disp("A mátrix determinánsa: ")
disp(det_A)
% ---------------------------- 3. feladat vége ----------------------------