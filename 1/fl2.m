function fl2(t, k1, k2)

% fl2(6, 2, 4)
% t: mantissza hossza
% k- (k1) és k+ (k2): karakterisztika alsó és felső korlátai

% formátum ellenőrzés, ha minden helyes megy tovább különben error

if isreal(t) && (t>0) && (rem(t,1) == 0) && (k1<k2)
   
    m8 = (1-2^(-t)) * 2^k2                     % Számhalmaz legnagyobb elemszáma (1-2^(-t))*2^k+
    e0 = 2^(k1-1)                              % M-ben a legkisebb pozitív szám   2^(k-) -1
    e1 = 2^(-t+1)                              % Az egynél nagyobb legkisebb gépi szám és egy különbsége  2^(-t+1)
    elemszamOsszes = 2^t * (k2 - k1 + 1);      % Számhalmaz elemszáma (összesen)

    elemek = zeros(elemszamOsszes, 1);         % létrehozunk egy t hosszú 0-ás vektort amin iterálunk
    count = 1;      % Számláló a tömb indexeléséhez

    for e = [0, 1]      % Iterálunk a [0, 1] vektor elemein
        % Ez az elő-for ciklus azért kell hogy szimmetrikusan is ábrázolja
        % a fv-t. Ha ez nincs akkor csak a fv jobb oldalát ábrázolja
        for k = k1:k2
            for mantissza = 0:2^t-1

                mantisszaBin = dec2bin(mantissza,t);
                
                % Minden karakter után rak egy vesszőt
                mantisszaBin = regexprep(mantisszaBin, '(\d)', '$1,');
                % Utolsó vessző eltávolítása
                mantisszaBin = mantisszaBin(1:end-1);
                % Gépi számmá alakítja
                gepiSzam = [e, str2num(mantisszaBin), k];
                % Fv. segítségével kiszámolja a gépi szám értékét
                elemek(count) = fl1(gepiSzam);
                count = count + 1;
            end
        end
    end

% vektort hozunk létre amit reprezentálnak, az első fv-el kiszámoljuk az értékét és azokat ábrázoljuk
% első jegy fix nulla (előjel)
% k1 - k2-ig megyünk ez előállítja a mantisszákat
% 0...0 (t db 0)
% 011.111 
% mindig +00..01-et adunk hozzá
% karakterisztikát ábrázoljuk
    
    % ábrázolás:
    figure;
    hold on;            % felülírás tiltása
    plot([e0, e1, m8], zeros(3),'rx', 'markersize', 15);
    stem(elemek, zeros(size(elemek)), 'b.');
    title('Számhalmaz elemei');
    grid on;            
else
    disp('A megadott számok nem megfelelőek!');
end