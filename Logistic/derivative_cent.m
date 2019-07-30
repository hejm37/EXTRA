function d = derivative_cent(Ms, ys, x)
    n = size(Ms, 3);
    m = size(Ms, 2);
    
    expr = exp(-squeeze(sum(exp(Ms .* x))));
    tot =  sum(reshape((-expr .* ys) ./ (1+expr), 1, m, n) .* Ms, [2,3]);
    d = tot / (n*m);
end