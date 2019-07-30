% Parameters
n = 200;
m = 10;
p = 20;
r = 0.2;
epsilon = 1;

[M_adj,Ms,ys,W] = generate(n, m, p, r, epsilon);

save('data.mat')

function [M_adj,Ms,ys,W] = generate(n, m, p, r, epsilon)
    rng('default');
    % Generate Adjacent Matrix
    M_adj = zeros(n);
    for i = 1:n
        for j = i+1:n
            if rand() < r
                M_adj(i, j) = 1;
                M_adj(j, i) = 1;
            end
        end
    end
    
    % Generate Ms
    Ms = normrnd(0, 1, p, m, n);
    
    % Generate ys
    ys = 2*(randi(2, m, n) - ones(m, n)) - ones(m, n);
    
    % Generate W
    W = zeros(n);
    for i = 1:n
        for j = i+1:n
            if M_adj(i, j) == 1
                W(i,j) = 1/(max(sum(M_adj(:,i)), sum(M_adj(:,j)))+epsilon);
                W(j,i) = W(i,j);
            end
        end
    end
    % calculate W_ii
    W = W + diag(ones(1, n) - sum(W));
end
