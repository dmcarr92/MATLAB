function fib = fibonacci(n)
x = zeros(1,n);
x(2) = 1;
for i = 3:n
    x(i) = x(i-1) + x(i-2);
end
disp(['The ',num2str(n),'th term in the Fibonacci sequence is ',num2str(x(n))])