function vect = fl1(x)

%x=[0 1 0 0 0 0 1 3]
% = 4.1250

% e - előjel (+-)
% 2. elemtől indul mert az első elem az előjelet tartalmazza.
% sum - összeget tartalmazó változó

if ~isvector(x)          % Ha nem vektort adtunk meg akkor errort dob ki.
    error("Not a vector!");
end

karakterisztika = x(end);
elojel = x(1);
sum = 0;

for k=2:length(x)-1
   sum = sum + x(k) * 2^(-(k-1));
end
disp(sum);
vect = sum * (2^karakterisztika) * ((-1)^elojel);
