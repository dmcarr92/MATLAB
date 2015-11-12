function Wavg = weighted_avg(x,y)
if length(x) ~= length(y)
    error('The two arrays must be of the same length. ')
end
Wavg = vecsum(x.*y)
end