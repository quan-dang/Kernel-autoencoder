clear;

% load data, each row is one record
load('data.mat');

projected_data = pca(data'); % projected data to 2 dimensional space

scatter(projected_data(1, 1:2946), projected_data(2, 1:2946), 'd');
hold on;
scatter(projected_data(1, 2947:3171), projected_data(2, 2947:3171), '*');
hold on;
scatter(projected_data(1, 3172:3692), projected_data(2, 3172:3692), 's');