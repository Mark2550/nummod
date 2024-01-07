function result = fl4(v1, v2)
% v1, v2 a 2 gépi szám

% fl4([0 1 1 1 1 0 2], [0 1 1 0 1 0 3])

if ~isvector(v1) || ~isvector(v2)
    error('v1 és v2 csak vektor lehet.');
end

e1 = v1(1);                     % 1. vektor előjele
e2 = v2(1);                     % 2. vektor előjele

man1 = v1(2:end-1);             % 1. vektor mantisszája
man2 = v2(2:end-1);             % 2. vektor mantisszája

karakter1 = v1(end);            % 1. vektor karakterisztikája
karakter2 = v2(end);            % 2. vektor karakterisztikája

%---------------------------- Ellenőrzések --------------------------------
if (e1 ~= 0 && e1 ~= 1) || (e2 ~= 0 && e2 ~= 1)
    error('Az előjelbit csak 0 és 1 lehet.');
end

if (e1 == 1 || e2 == 1) && (e1 == 0 || e2 == 0)
    error('Nem összeadásról van szó.')
end

if length(v1) ~= length(v2)
    error('Nem azonos dimenzióból valók')
end

% Mantissza vizsgálata
if any(man1 ~= 0 & man1 ~= 1) || any(man2 ~= 0 & man2 ~= 1)
        % Ha a 2 mantissza karakterei nem 1 és 0-ból állnak akkor:
        error('A mantissza csak 0 és 1 közötti számokat tartalmazhat.');
end
%---------------------------- Ellenőrzések vége ---------------------------


% Közös karakterisztikára kell-e hozni?
if karakter1 ~= karakter2
    b_k = karakter1 > karakter2; % nagyobb karakterisztika
    if b_k == 1
        % man2 shiftelése balra
        b_k = karakter1;
        tmp = karakter1-karakter2;
        man2 = [zeros(1, tmp), man2(1:end-(tmp))];
    else
        % man1 shiftelése balra
        b_k = karakter2;
        tmp = karakter2-karakter1;
        man1 = [zeros(1, tmp), man1(1:end-(tmp))];
    end

    % Számok összeadása binárisan
    res = binaryAddition(man1, man2);
    % Normalizálás
    [normalized, kar] = normalize(length(man1), res, b_k, man1);
    normalized = sprintf("%d", normalized);
    result = [num2str(e1), num2str(normalized), num2str(kar)];
else
    % Számok összeadása binárisan
    res = binaryAddition(man1, man2);
    % Normalizálás megnézése
    % n1_k és n2_k ugyanaz tehát mindegy melyiket adom meg
    [normalized, kar] = normalize(length(man1), res, karakter1, man1);
    normalized = sprintf("%d", normalized);
    result = [num2str(e1), num2str(normalized), num2str(kar)];
end
end

function [normalized, kar] = normalize(t, number, k, orig)
% Bináris szám normalizálása
if length(number) > t
    % Kell-e kerekíteni?
    if number(end) == 1
        aa = zeros(1, t);
        % Kell tömbként megadni az 1-et binárisan pl. 00001
        aa(t) = 1;
        normalized = binaryAddition(number(1:t), aa);
        kar = k + (length(number)-length(orig));
    else
        normalized = number(1:t);
        kar = k + (length(number)-length(orig));
    end
else
    normalized = number;
    kar = k;
end
end

function resultBin = binaryAddition(man1, man2) % Bináris összeadás
carry = 0;  % Átvitel (0 ha nincs)

% Az eredmény bináris száma
result = zeros(size(man1));

% Bitenkénti összeadás
for k = length(man1):-1:1
    bit1 = man1(k);
    bit2 = man2(k);
    osszeg = bit1 + bit2 + carry;
    if osszeg >= 2
        carry = 1;
        osszeg = mod(osszeg, 2);
    else
        carry = 0;
    end
    result(k) = osszeg;
end
% Ha a ciklus után még van átvitel, hozzáadjuk az eredményhez
if carry
    result = [1, result];
end
resultBin = result;
end