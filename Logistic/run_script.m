
load('data.mat')
itr = 10000;

x_his = centralized(Ms, ys, 'alpha', 0.0059);
x_star = x_his(itr);

x_his = extra(Ms, ys, W, 'alpha', 0.0059);

save('result.mat', 'x_star', 'x_his');
