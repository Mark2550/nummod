function M = householder(p1,p2)

% householder([6;2;3;0], [4;2;5;2])
% householder([1;2;3], [1;1;1])
if (norm(p1, 2) ~= norm(p2, 2)) || length(p1) ~= length(p2)    % tétel alapján
    error('A vektorok dimenziója/normája hibás!')
end
p = p1 - p2;
szigma = -sign(p(1))*norm(p, 2);

tmp = zeros(length(p), 1);
tmp(1) = 1;

v = p - szigma * tmp;
% a − σ · e1 (numerikus példatárból)

v = v / norm(v, 2);         % Vektorok hossza (normája)
                            % v' a v vektor transzponáltja
hossz = length(p);

H = eye(length(p)) - hossz * (v * v');
M = H;