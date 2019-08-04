number_of_pc = 10;
data = new_coordination_kpca(new_data_mnist,eigvec,eigval,number_of_pc,options);

% Build test data y
% test_original = images(:,40000:40099);
% [eigvec_test,eigval_test] = peiyan_kpca(test_original',options);
% test_transformed = new_coordination_kpca(test_original,eigvec_test,eigval_test,number_of_pc,options);

z = zeros(784,100);

% Run the peiyan_kernel_linear_regression.m function

for c = 1:784
    z(c,:) = peiyan_kernel_linear_regression(data,new_data_mnist(c,:),data,options);
end

figure;
display_network(z(:,:));

figure;
display_network(new_data_mnist);

[mssim, ssim_map] = ssim_index(z,new_data_mnist);
err = immse(new_data_mnist,z);
