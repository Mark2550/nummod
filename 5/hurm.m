function [x,y] = hurm(fv, a, b, n,pontossag)

% a=1,b=2
% fv = @(x)x^3-2*x-1
% n=100, pontossag=1e-6
 if (fv(a) * fv(b) > 0)     % Ha rossz az intervallum    
        error('Az intervallum(ok) nem megfelelő(ek)!');
 end
 % https://math.uni-pannon.hu/~lipovitsa/num/5.pdf
 start_a = a;
 start_b = b;
 kozelites = (a*fv(b)-b*fv(a)) / (fv(b)-fv(a));
 % https://edu.epito.bme.hu/local/coursepublicity/mod/resource/view.php?id=69540
 for k = 1:n
        % Az intervallum "felének" kiszámítása:
        c = (a*fv(b)-b*fv(a)) / (fv(b)-fv(a));
        % Ha az érték a nullához közelít a megadott toleranciánktól, akkor
        % találtunk egy megoldást
        if(abs(fv(c)) < pontossag)
            x = c;
            plot(linspace(-10,10),zeros(100,1),'-');
            hold on;
            plot(zeros(100,1),linspace(-10,10),'-');
            title('Húrmódszer');
            plot(kozelites, 0, 'o');
            hold on;
            plot(start_a, fv(start_a), 'x');
            hold on;
            plot(start_b, fv(start_b), 'x');
            hold on;
            fplot(fv, [start_a, start_b]);
            hold on;
            plot([start_a start_b], [fv(start_a) fv(start_b)])
            return;
        end

        if(fv(c) * fv(a) < 0)  % Az intervallum "bal" oldala
            b = c;
        else    % Az intervallum jobb oldala (felétől b-ig)
            a = c;
        end
 end