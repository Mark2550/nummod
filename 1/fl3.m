function machine_num = fl3(varargin)

if nargin == 1      % Ha 1db számot adtunk meg akkor a feladatban leírtak alapján számolunk
    t = 8;          % Mantissza hossza
    k1 = -5;        % k-
    k2 = 5;         % k+
    numb = varargin{1};   % Szám értéke
else
    t = varargin{1};
    k1 = varargin{2};
    k2 = varargin{3};
    number = varargin{4};
end




% Előjelbit meghatározása:
e = 0;      % Pozitív
if number<0 
    e = 1;      % Negatív szám
    number = number * 1;        % Könnyebb legyen vele dolgozni
end

% Számhalmaz korlátai (m8 és e0), ábrázolható-e?
e0 = (2^k1)-1;
m8 = (1-2^-t) * (2^k2);
if (number < e0 || number > m8)
    error('A szám a korlátokon kívülre esik -> nem ábrázolható');
end

% Egész szám megadásánál könnyebb a számolás:
mantissza = dec2bin(number, t);
if mod(number, 1) == 0



else    % itt a tört részt és az egészet splitelni kell
    
    egesz = fix(abs(x));
    maradek = mod(abs(x),1);

    
end





