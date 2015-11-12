function y = swap_ends(x)
x1 = x(:,1);
xL = x(:,length(x));
x(:,1) = xL;
x(:,length(x)) = x1;
y = x;
end
