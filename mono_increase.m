function tf = mono_increase(x)
xL = length(x);
if xL ~= 1
   tf1 = true;
else tf1 = false;
end
for i = 2:xL
    if x(i) <= x(i-1)
        tf2 = false;
        break
    else tf2 = true;
    end
end
if tf1 == true && tf2 == true
    tf = true;
else tf = false;
end
end

        
    


