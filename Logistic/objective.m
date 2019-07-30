function value = objective(Ms, ys, xs)
    n = size(Ms, 3);
    m = size(Ms, 2);
    p = size(Ms, 1);
    
    mat = log(1+exp(-squeeze(sum(Ms .* reshape(xs, p, 1, n))) .* ys));
    tot = sum(mat(:));
    value = tot / (n*m);
end