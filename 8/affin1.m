function transf_matrix = affin1(varargin)
transf_matrix = [];
% A sík (a tér) önmagába való egyenestartó transzformációját 
% affin transzformációnak (affinitásnak) nevezzük
% affin mátrixa: G=[a;b], G1=[c;d] Mátrix:= [a,c ; b,d]


%Minden olyan affin transzformáció a síkon, amely a kord.r. origóját 
% fixen hagyja, egyértelműen jellemezhető egy 2×2-es mátrix-szal és 
% a transzformáció hatását egy v vektorral jellemzett pontra az A·v
% mátrixszorzattal számolhatjuk

if varargin == 0
    disp(['Adja meg a [0,1] pont képét: ']);
    p1 = ginput;
    disp(['Adja meg az [1,0] pont képét: ']);
    p2 = ginput;

elseif varargin == 2
    % Ellenőrizzük hogy tömböt adtunk-e meg (x és y koordináta)
    if isnumeric(varargin{1}) && isnumeric(varargin{2})

        % isnumeric-et ellenőrizni kell tényleg jó-e
        p1 = varargin{1};
        p2= varargin{2};
        
        % számolások, képlet, eredményadás
    else
        error('A két pontot tömbbe add meg! [x,y]');
    end
else
    error('Túl kevés vagy túl sok paramétert adott meg!');
end

end %function end

