format compact
clear all
clc

% Array of all the individual grades
grades = [84 85 90 92 93];

% Array of each grade's weight (tests, quizzes, homeworks, etc. have
% different weights)
weights = [.15 .10 .25 .2 .3];

% weighted_avg function uses the vecsum function to multiply each element
% of the two arrays and then take the sum of the product array
weighted_avg(grades,weights);