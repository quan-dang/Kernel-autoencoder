load('t');
minfa = fa(target(1,1));
x = 1;
for c = 2:10
    if fa(target(c,1)) < minfa
       minfa = fa(target(c,1));
       x = c;
    end
end