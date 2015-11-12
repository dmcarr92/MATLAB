function tf = perfect_sq(x)
y = x.^2;
z = ismember(x,y);
for i = 1:length(z)
    if z(i) == true
        tf = true;
        break
    else tf = false;
    end
end
tf
end
% perfect_sq tests to see if an array, x, contains an element that is the
% perfect square of another of its elements.