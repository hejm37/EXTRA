function x_his = centralized(M_adj, Ms, ys, varargin)
% Implementation of EXTRA on Logistic problem
    n = length(M_adj);
    p = size(Ms, 1);
    
    defaultAlpha = 0.5;
    defaultItr = 10000;
    defaultX0 = zeros(p, 1);
    par = inputParser;
    addParameter(par, 'alpha', defaultAlpha);
    addParameter(par, 'itr', defaultItr);
    addParameter(par, 'x0', defaultX0);
    parse(par, varargin{:});
    
    alpha = par.Results.alpha;
    itr = par.Results.itr;
    xk_1 = par.Results.x0;
    x_his = zeros(p, itr);

    % main iteration loop    
    for k = 1:itr
        xk = xk_1 - alpha * derivative_cent(Ms, ys, xk_1);
        
        x_his(:,k) = xk;
        xk_1 = xk;
        
        % calculate the error.
        if mod(k, 100) == 0 || k == 1
            fprintf('Iteration %d, objective %f\n', k, ...
                objective(Ms, ys, repmat(xk, 1, n)));
        end
    end
end