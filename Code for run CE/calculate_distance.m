% cluster_one,cluster_two,center_cluster_one,center_cluster_two are column
% vectors.

function distance = calculate_distance(cluster_one,cluster_two,kernel_parameter)

options = struct('KernelType','Gaussian','t', kernel_parameter);

% contructKernel function receives row vectors as parameters
n = size(cluster_one,2); % number of data points

% calculate sum of K(x_k,x_h) i.e. K1, K(x_k,y_h) i.e. K2, K(y_k,y_h) i.e. K3
sum_K1 = 0; sum_K2 = 0; sum_K3 = 0;

for p = 1:n
   for q = 1:n
       sum_K1 = sum_K1 + constructKernel(cluster_one(:,p)',cluster_one(:,q)',options);
       sum_K2 = sum_K2 + constructKernel(cluster_one(:,p)',cluster_two(:,q)',options);
       sum_K3 = sum_K3 + constructKernel(cluster_two(:,p)',cluster_two(:,q)',options);
   end
end

distance = (1/n) * sqrt(sum_K1 - 2*sum_K2 + sum_K3);


