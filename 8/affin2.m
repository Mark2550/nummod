function transf_matrix = affin2(varargin)

if nargin == null
    disp(['Adja meg a háromszög ''a'' oldalát: ']);
    a = ginput;
    disp(['Adja meg a háromszög ''b'' oldalát: ']);
    b = ginput;
    disp(['Adja meg a háromszög ''c'' oldalát: ']);
    c = ginput;
    % + 3 oldalhoz tartozó transzformáció oldalát

elseif varargin == 6
    % Ellenőrizzük hogy tömböt adtunk-e meg (x és y koordináta)
    if isnumeric(varargin{1}) && isnumeric(varargin{2})

        % isnumeric-et ellenőrizni kell tényleg jó-e

        
        % számolások, képlet, eredményadás
    else
        error('A koordinátákat tömbbe add meg! [x,y]');
    end
else
    error('Túl kevés vagy túl sok paramétert adott meg!');
end

end

