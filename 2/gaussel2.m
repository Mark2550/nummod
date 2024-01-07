function x = gaussel2(A,b)

reszletek = input("Szeretné kiiratni a közbülső mátrixot? igen - 1, nem - 0");
choice = input("Teljes (0) vagy részleges (1) legyen?");

if(~choice)
    Teljes(A,b,reszletek);
end

%   A = [ 1 2 -1;2 -1 3;-1 3 1 ]
%   b = [4;3;6]

% A - egyenletrendszer mátrixa,
% b - jobboldal vektor
% x - megoldásvektor
% Li és LU-t nem kell számolni!

n = max(size(A))       % Mátrix rangja
% A GE négyzetes mátrix esetén hajtható vége ÉS a mátrix sora meg kell
% egyezzen a b vektor sorainak számával:
% Ha a mátrix alulhatározott:

if size(A,1) < size(A,2)
    warning("A mátrix alulhatározott!");
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

    for k=1:n
        for l=k+1:n
            if(A(k,k) == 0)
                warning("Az átlóban lévő elem 0: nem lehet részleges főelemkiválasztás!")
                warning("A program folytatódit teljes főelemkiválasztással!")
                Teljes(A,b,reszletek);
            end
            % Ha a főátlóbeli elemek mind 0 abban az esetben van szükség
            % sor/oszlop cserére
    
            m =  A(l,k) / A(k,k);     % Osztó/szorzó hogy kinullázzuk az elemeket
            A(l,:) = A(l,:) - A(k,:)*m;     % Főátló alatti elemek nullázása
            b(l) = b(l) - b(k)*m;
            % Közbülső mátrix kiiratása:
    
            % if(reszletek == 'y' || reszletek == "igen" || reszletek == 'i')
            % Comparison between double and string is not supported. :))))))
    
            % Inkább megkötöm a felhasználót
            if(reszletek)
                fprintf("A közbülső A(%i) mátrix\n", k);
                disp([A, b]);
            end
        end
    end
x = megoldas(A,b);
end

function x = Teljes(A,b,reszletek)

    n = size(A,1);
    Ab = [A,b];

    for k = 1:n
        % Abszolútértékkel dolgozunk, mert főelemkiválasztásnál erre van
        % szükség

        [maxVal,maxRow] = max(abs(Ab(k:end, k:end)));
        % A fenti sor létrehoz egy felső3szög mátrixot

        [~,maxCol] = max(maxVal);       
        % Meghatározza az abszolútértékek között a maximális értéket
        maxRow = maxRow(maxCol);
        

        % Sorcsere
        if maxRow > 1
            Ab([k, k+maxRow-1],:) = Ab([k+maxRow-1,k],:);
        end
        

        %Oszlopcsere
        if maxCol > 1
            Ab(:,[k, k+maxCol-1])=Ab(:,[k+maxCol-1,k]);
        end

        if reszletek
            fprintf('Közbülső A(%i) mátrix\n',k);
            disp(Ab);
        end

        for i = k+1:n
            m = Ab(i, k) / Ab(k, k);
            Ab(i, k+1:end) = Ab(i, k+1:end) - m * Ab(k, k+1:end);
        end
    end
    b = Ab(:,end);  % Utolsó oszlop lesz a b vektor
    x = megoldas(Ab(:, 1:end-1), b);
    return
end

function x = megoldas(U,b)      % Egyenlet megoldása, ismeretlenek meghatározása
    n = size(U,1);
    x = zeros(n,1);
    x(n) = b(n) / U(n,n);
    for k = n-1:-1:1
        x(k) = (b(k) - U(k,k+1:end) * x(k+1:end)) / U(k, k);
    end
end




