function alt_inverz = geninv(A)

%  A = [1 1 1 1 ; 2 2 2 2 ; 3 3 3 3 ; 4 4 4 4]

if rank(A) == min(size(A))  % Teljes rangú mátrix esetén
    % Ellenőrzés
    [m, n] = size(A);
    if (m >= n)
        % A^*: mátrix konjugáltja
        % A^-1: mátrix inverze
        % Legyen A ∈ Cm×n ahol m ≥ n és rangA = n, azaz A oszlop-reguláris. 
        % Ekkor: A+ = (A∗A)^−1 A∗
        
        disp('Túlhatározott teljesrangú eset');
        alt_inverz = (A'*A)/A'; % inv(A'*A)*A';
        
    else
        % Legyen A ∈ C^m×n ahol m ≤ n és rangA = m, azaz A sor-reguláris. 
        % Ekkor: A+ = A∗(AA∗)−1.
        disp('Alulhatározott teljesrangú eset');
        alt_inverz = A'/(A*A'); %A'*inv(A*A');
    end
    % Ha A^n*n (négyzetes) nem szinguláris mátrix akkor bármelyik
    % módszerrel számolhatunk.
    
    % Rangfaktorizáció
    r = rank(A);
    
    % Az általánosított inverz kiszámítása
    alt_inverz = A' / (A * A');
else
    alt_inverz = pinv(A);
end
end
