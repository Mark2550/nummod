function result = fl3(varargin)
    % fl3(3.1, 8, 2, 4)
    % fl3(12, 5, -20, 50)
    % Ha 1db számot adtunk meg akkor a feladatban leírtak alapján számolunk
    if nargin == 1      
        t = 8;          % Mantissza hossza
        k1 = -5;        % k-
        k2 = 5;         % k+
        number = varargin{1};
    else
        t = varargin{2};
        k1 = varargin{3};
        k2 = varargin{4};
        number = varargin{1};
    end

    % Számhalmaz korlátai (m8 és e0), ábrázolható-e?
    e0 = (2^k1)-1;
    m8 = (1-2^-t) * (2^k2);
    if (number < e0 || number > m8)
        error('A szám a korlátokon kívülre esik -> nem ábrázolható');
    end
    
    % Előjelbit meghatározása
    e = number < 0;
    number = abs(number);

    egesz = fix(number);
    maradek = abs(number) - egesz;

    maradek_hossz = strlength(char(maradek))-2;
    maradek = maradek * 10^maradek_hossz;

    % Binárissá alakítás
    egesz = dec2bin(egesz);

    egesz_hossz = strlength(egesz);
    for_index = t - egesz_hossz + 1;

    maradek2 = zeros(1, for_index);
    valtoszam = 10^maradek_hossz;
    for k = 1:for_index-1
        maradek = maradek * 2;
        if maradek > valtoszam
            maradek2(k) = 1;
            maradek = maradek - valtoszam;
        end
    end

    egesz = egesz - '0';
    gepiszam_vec = [egesz, maradek2];

    if gepiszam_vec(t+1) == 1 && gepiszam_vec(t) == 1
        gepiszam_vec(t) = 0;
        while gepiszam_vec(t) == 1 && t > 1
            gepiszam_vec(t) = 0;
            t = t - 1;
        end
        gepiszam_vec(t) = 1;
    else
        gepiszam_vec = gepiszam_vec(1:t);
    end

    % Eredmény átadása
    if e          
        gepiszam_vec = [1, gepiszam_vec, egesz_hossz];
    else
        gepiszam_vec = [0, gepiszam_vec, egesz_hossz];
    end
    result = gepiszam_vec;
end
