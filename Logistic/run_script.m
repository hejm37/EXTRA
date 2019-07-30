
n = 200;
m = 10;
p = 20;
r = 0.2;
epsilon = 1;

[M_adj,Ms,ys,W] = generateData(n, m, p, r, epsilon);

% x_his = centralized(M_adj, Ms, ys, 'alpha', 200000, 'itr', 10000);
x_his = extra(M_adj, Ms, ys, W, 'alpha', 0.00000000001);
