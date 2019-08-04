number_of_pc = 1;
data = new_coordination_kpca(new_data_mnist,eigvec,eigval,number_of_pc,options);

z = zeros(784,100);

% Run the peiyan_kernel_linear_regression.m function

for c = 1:784
    z(c,:) = peiyan_kernel_linear_regression(data,new_data_mnist(c,:),data,options);
end

figure;
display_network(z(:,:));

[mssim, ssim_map] = ssim_index(z,new_data_mnist);
err = immse(new_data_mnist,z);
psnrindex = psnr(z,new_data_mnist);
