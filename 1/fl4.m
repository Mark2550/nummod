function vect = fl4(v1,v2)

% Ellenőrzés, azonos dimenziók-e: (ugyanolyan hosszúak-e)
if length(v1) == length(v2)

    karakter1 = v1(end);            % 1. vektor karakterisztikája
    karakter2 = v2(end);            % 2. vektor karakterisztikája

    e1 = v1(1);                     % 1. vektor előjele
    e2 = v2(1);                     % 2. vektor előjele

    man1 = v1(2:end-1);             % 1. vektor mantisszája
    man2 = v2(2:end-1);             % 2. vektor mantisszája
    summ = zeros(size(v1));

    if any(man1 ~= 0 & man1 ~= 1) || any(man2 ~= 0 & man2 ~= 1)
        % Ha a 2 mantissza karakterei nem 1 és 0-ból állnak akkor:
        error('A mantissza csak 0 és 1 közötti számokat tartalmazhat.');
    end

    % Kell e közös karakterisztikára hozni?
    if(karakter1 ~= karakter2)                          % 2. vektor mantisszájának eltolása balra
        if(karakter1 > karakter2)
            current_k = karakter1;
            temp_k = karakter1-karakter2;               % 2 karakterisztika különbsége
            man2 = [zeros(1,temp_k), man1(1:end-(temp_k))];     % K-ig kellenek az elemek

        else                                            % 1. vektor mantisszájának eltolása balra
            current_k = karakter2;
            temp_k = karakter1 - karakter2;
            man1 = [zeros(1,temp_k), man1(1:end-(temp_k))];
        end
        summ = add2binary(man1,man2);          % Számok összeadása
    else            % Amikor a 2 karakterisztika megegyezik:
        summ = add2binary(man1,man2);
    end

    % Normalizálás:
    %.
    %.
    %.
    %.
    % Normalizálás
else
    disp("A gépi számok dimenziója nem egyezik!")
end


    % 2 vektor összeadása
    function result = add2binary(v1,v2)         % 2 bináris számot ad össze

        carry = 0;      % Átvitel

        result = zeros(size(v1));
        for k = length(v1):-1:1
            v1_bit = v1(k);
            v2_bit = v2(k);

            summ = v1_bit + v2_bit + carry;
            if summ >= 2
                carry = 1;
                summ = mod(summ,2);     % Az érték így 1 vagy 0 lehet csak
            else
                carry = 0;
            end
            result(i) = summ;           % Bitek tárolása egyesével

            if carry == 1       % Ha maradt még átvitel akkor hozzá adjuk az első helyre
                result = [1, result];
            end
        end
    end
end



