function approx = lnmaprox(fokszam, x, y)

    % lnmaprox(4, [-2,-1,0,1,2], [-4, -2, 1, 2, 4])
    % fokszam megadása: pontok -1

    % Ellenőrzés (csomópontok száma megegyezik-e a fokszámmal)
    if length(x) ~= fokszam + 1 || length(y) ~= fokszam + 1
        error('A csomópontok száma nem egyezik meg a fokszámmal!');
    end
    
    % normálegyenletrendszernek kell egy mátrixot létrehozni
    A = zeros(fokszam + 1, fokszam + 1);
    for i = 1:fokszam + 1
        for j = 1:fokszam + 1
            A(i, j) = sum(x.^(i+j-2));
        end
    end

    % jobboldalhoz oszlopmátrix
    B = zeros(fokszam + 1, 1);
    for i = 1:fokszam + 1
        B(i) = sum(y .* x.^(i-1));
    end

    % a normálegyenletrendszer megoldása
    approx = A \ B;

    % Ha szükséges, kérjük a felhasználót, hogy ábrázolja az eredményt
    prompt = 'Szeretné ábrázolni az approximációs polinomot? (y/yes/igen): ';
    answer = input(prompt, 's');
    if strcmp(answer, 'igen') || strcmp(answer,'y') || strcmp(answer,'1') || strcmp(answer,'yes')
        % Ábrázolás
        xx = linspace(min(x), max(x), 1000);
        yy = polyval(flipud(approx), xx); % polyval(): a polinom értékeit számolja ki

        figure;
        plot(x, y, 'o', xx, yy, '-');
        title('Legkisebb négyzetek módszerével approximált polinom');
        xlabel('X');
        ylabel('Y');

        % jobb felül jelmagyarázat
        legend('Csomópontok', 'Approximációs polinom');
    end
end
