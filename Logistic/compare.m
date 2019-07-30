
load('result.mat')
x_star = repmat(x_star, 1, n);

itr = length(x_his);
denominator = norm(x_star, 'fro');

residual = zeros(itr, 1);
for i = 1:itr
    residual(i) = norm(x_his(:,:,i) - x_star, 'fro')/denominator;
end

plotResidual(residual, itr);

function plotResidual(residual, itr)
% Plot result: distance to optimal point
    itr = min(itr, length(residual));
    plot(1:itr, log(residual(1:itr)));
    title 'log distance to optimal point';
    xlabel 'itreration';
    ylabel 'y';
    fprintf('Residual plot finished\n')
    legend('y=||x_k-x_start||_F \ ||x_0-x_start||_F')
end