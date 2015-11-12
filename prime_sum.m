function y = prime_sum(x)
z = 0;
for i = 1:length(x)
    if isprime(x(i))
        z = z + x(i);
    end
end
y = z
end
        