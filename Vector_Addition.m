%% Dillon Carr
% Find the sum of all elements in a matrix

format compact
clear all
clc

% Create an array, in this case a 3x3 2-dimensional matrix
x = [3 5 8;2 5 7;1 7 9]

% The transpose symbol turns a matrix on its side
y = sum(x)'

% The sum function gives the sum of each column of the matrix
% You can also write sum(x,2) and it will output the sum of each row
% By taking the sum of the sum of x, we are simplifying the 2D matrix to
% a 1D list of sums, and then taking the sum of these numbers.
z = sum(sum(x))

pause(1)
clear all

x = [372 235 458;383 762 274;982 944 198]

% Testing out vecsum, everyother and remove_column
y = vecsum(x)
z = every_other(x)
k = remove_column(x,2)


% Cleanup function turns all elements that do not fit within its range
% (0 - 10) into NaN (Not a Number)
a = [5 12 16 -2 4 22 -1];
b = cleanup(a)

% Testing swap_ends
pause(1)
clear all

x = magic(4)
y = swap_ends(x)

% Testing mono_increase
z = [1 2 3 ]
tf = mono_increase(z)

pause(1)
clear all

% Testing perfect_sq
x = [4 3 8 64]
y = perfect_sq(x);
