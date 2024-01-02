function [Q,R] = gramschmidt(A)
% https://people.inf.elte.hu/hozsaai/3_felev/Nummod1/Locsi-esti-ea-dia/nummod1esti_ea04.pdf
% itt minden szépen le van írva


% A - négyzetes Mátrix
% Q és R: ortogonális és felső3szög M.
% QR felbontás = ortogonális felbontás
% A = Q*R


% Ellenőrzés: A oszlopai lineárisan függetlenek:
if rank(A) == size(A, 2)
    disp('Az oszlopok lineárisan függetlenek.');
else
    disp('Az oszlopok lineárisan függők.');
end

% Előre deklaráljuk őket:
[n,m] = size(A);        % n-sorok száma, m oszlopoké

Q = zeros(n,m);
R = zeros(m,m);

% a1 ... a(n) lin. független vektorok rendszere
% q(k)-kat keressük, ami megegyezik a (Q) mátrix oszlopainak számával
% q-k ortonormált vektorok
% span(ai) = span(qi)    ; szabály
% r11 = norm(a1,2)
% norm(x) = vektor hossza
for k=1:n
    Q(:,k) = A(:,k);        %Qk oszlopai = Ak oszlopaival

    for l=1:k-1
        R(l,k) = Q(:,l)'*A(:,k) ; % r(ik) = <ak, qi>, skaláris szorzat 
        % ha fordítva szorzom errort ad ki :))
        Q(:,k) = Q(:,k) - R(l,k)*Q(:,l); % qk kiszámítása
    end

    % Norma számítása
    R(k,k) = norm(Q(:,k));

    % normalizálás
    Q(:,k) = Q(:,k)/R(k,k); % qk = qk / rkk
end

