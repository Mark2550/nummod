function adatok = fl2(t, k1, k2)

%először formátum ellenőrzés, ha minden helyes megy tovább különben error
if isreal(t) && (t>0) && (rem(t,1) == 0) && (k1<k2)
    % jelölések: 
    % t: mantissza hossza
    % k- (k1) és k+ (k2): karakterisztika alsó és felső korlátai
	
    %számítás:
    m8 = (1-2^-t) * (2^k2);                     % Számhalmaz legnagyobb elemszáma (1-2^(-t))*2^k+
    e0 = (2^k1)-1;                              % M-ben a legkisebb pozitív szám   2^(k-) -1
    e1 = 2^(-t+1);                              % Az egynél nagyobb legkisebb gépi szám és egy különbsége  2^(-t+1)
    elemszamok = 2*2^(t-1) *(k2 - k1 + 1);      % Számhalmaz elemszáma (összesen)
    
    % Elemszámok jók, többi nem biztos.

    disp(m8);
    disp(e0);
    disp(e1);

    %számhalmaz elemeinek számolása

    e = zeros(1,t);                 %létrehozunk egy t hosszú 0-ás vektort amin iterálunk
    realNum = zeros(elemszamok, 1); % gépi számok valós megfelelőjét tárolja és ezt a tömböt fogjuk majd ábrázolni  
    additionE = (e);
    additionE(end) = 1;             % ezt fogjuk minden iterációnál hozzáadni (+ 0...01) amíg az első érték 1 nem lesz
    counter = 1;
    while e(1) ~= 0
        for k= k1:k2
            for mantissza = 0:2^t-1
                
                % e vektorhoz 0...01 hozzáadása (fl4 segítségével):
                tempA = [0,e,k];
                tempB = [0,additionE, k];
                tempE = fl4(tempA, tempB);
                

                
                % Függvényhez szükséges vektor előállítása:
                % (előjel,.010..,karakterisztika)
                gepi_szam = [tempE];

                % Gép szám értékének kiszámolása fl1-gyel, majd tárolása
                % tömbben
                realNum(counter) = fl1(gepiszam);
                counter = counter + 1;
                
            end
        end
    end

% vektort hozunk létre amit reprezentálnak, az első fv-el kiszámoljuk az értékét és azokat ábrázoljuk
% első jegy fix nulla (előjel)
% k1 - k2ig megyünk ez előállítja a mantisszákat
% 0...0 (t db 0)
% 011.111 
% ezek wile ciklusba (amíg a legelső jegy 1 nem lesz)
% mindig +00..01-et adunk hozzá
% karakterisztikát ábrázoljuk
    
    %ábrázolás:
    figure;
    hold on;            % felülírás "tiltása"
    plot([e0, e1, m8], zeros(3),'rX', MarkerSize=10);
    stem(realNum, zeros(size(realNum)), 'b.');
    
    %Címadás
    title('Számhalmaz elemei')

    % Rács bekapcsolása
    grid on;            
else
    disp('A megadott számok nem megfelelőek!');
end