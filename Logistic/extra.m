function x_his = extra(M_adj, Ms, ys, W, varargin)
% Implementation of EXTRA on Logistic problem
    n = length(M_adj);
    p = size(Ms, 1);
    
    defaultAlpha = 0.0059;
    defaultItr = 10000;
    defaultX0 = zeros(p, n);
    par = inputParser;
    addParameter(par, 'alpha', defaultAlpha);
    addParameter(par, 'itr', defaultItr);
    addParameter(par, 'x0', defaultX0);
    parse(par, varargin{:});
    
    alpha = par.Results.alpha;
    itr = par.Results.itr;
    xs_k_2 = par.Results.x0;
    x_his = zeros(p, n, itr);
    W_tilde = (eye(n) + W) / 2;
%     parpool(4);

    % main iteration loop
    xs_k_1 = zeros(p, n);
    xs_k = zeros(p, n);
    
    fprintf("alpha");
    alpha
    
%     parfor i = 1:n
    for i = 1:n
        xs_k_1(:,i) = sum(W(:,i) .* xs_k_2.').' - ...
                    alpha*derivative(Ms(:,:,i), ys(:,i), xs_k_2(:,i));
    end
    x_his(:,:,1) = xs_k_1;
    
    for k = 2:itr
%         parfor i = 1:n
        for i = 1:n
            xs_k(:,i) = sum(W(:,i) .* xs_k_1.').' - ...
                        sum(W_tilde(:,i) .* xs_k_2.').' + ...
                        xs_k_1(:,i) - alpha* ...
                        (derivative(Ms(:,:,i), ys(:,i), xs_k_1(:,i)) ...
                        - derivative(Ms(:,:,i), ys(:,i), xs_k_2(:,i)));
        end
        fprintf("%d\n", k);
        dbstop if naninf
%         xs_k

        x_his(:,:,k) = xs_k;
        xs_k_2 = xs_k_1;
        xs_k_1 = xs_k;
        
        % calculate the error.
        if mod(k, 100) == 0 || k == 2
            fprintf('Iteration %d, objective %f\n', k, ...
                objective(Ms, ys, xs_k));
        end
    end
end