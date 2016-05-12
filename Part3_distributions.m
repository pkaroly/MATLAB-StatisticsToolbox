clear
close all
clc

x = -log(1-rand(100,1)) / 0.1;

plot(x);


exp_dist = fitdist(x,'exponential');
fitdist(x,'exponential')
histogram(x,0:5:max(x),'normalization','pdf');
hold on;
x_vals = 0:0.1:max(x);
% plot(x_vals,1/exp_dist.mu * ...
%     exp(-1/exp_dist.mu * x_vals));
plot(x_vals,pdf(exp_dist,x_vals));

