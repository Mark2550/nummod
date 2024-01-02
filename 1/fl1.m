function vect = fl1(x)

%vect(x) - vektor megadása
% negáció    : ~
% és         : &
% vagy       : | 
% egyenlőség : ==
% error(szöveg)
% tic (start), toc(stop) - stopper
% tömb indexelés 1-től kezdődik.


if ~isvector(x)          %Ha nem vektort adtunk meg akkor errort dob ki.
    error("Not a vector!");
end
karakterisztika = x(end);
elojel = x(1);


%e - előjel (+-)
%2. elemtől indul mert az első elem az előjelet tartalmazza.
% sum - összeget tartalmazó változó
sum = 0;
for k=2:length(x)-1
   sum = sum + x(k) * 2^(-(k-1));
end
disp(sum);
vect = sum * (2^karakterisztika) * ((-1)^elojel);
