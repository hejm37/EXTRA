function d = derivative_cent(Ms, ys, x)
    n = size(Ms, 3);
    m = size(Ms, 2);
    
    expr = exp(-sum(Ms .* x) .* reshape(ys, 1, m, n));
    tot =  sum(((-expr .* reshape(ys, 1, m, n)) ./ (1+expr)) .* Ms, [2,3]);
    d = tot / (n*m);
end