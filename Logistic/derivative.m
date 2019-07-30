function d = derivative(Mi, yi, xi)    
%     expr = exp(-(Mi.' * xi) .* yi);
%     frac = (-expr .* yi) ./ (1+expr) .* Mi.';
%     d = (sum(frac) / length(yi)).';

    expr = exp(-(xi.' * Mi) .* yi.');
    frac = (-expr .* yi.') ./ (1+expr) .* Mi;
    d = (sum(frac,2) / length(yi));
end