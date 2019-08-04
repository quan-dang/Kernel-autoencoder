load('quan_mnist.mat');
% display_network(mnist(:,:));

number_of_pc = 10;
% parameter = 3;

% 'Options' para for keiyan_pca.m function
% options = struct('KernelType','Polynomial','d',parameter);

parameter = 2.099905519512850e+03;
options = struct('KernelType','Gaussian','t',parameter);

% Run the peiyan_kpca.m function with imagesR #4 
[eigvec_0,eigval_0] = peiyan_kpca(mnist',options);

data_1 = new_coordination_kpca(mnist,eigvec_0,eigval_0,100,options);
[eigvec_1,eigval_1] = peiyan_kpca(data_1',options);

data_2 = new_coordination_kpca(data_1,eigvec_1,eigval_1,100,options);
[eigvec_2,eigval_2] = peiyan_kpca(data_2',options);

data_3 = new_coordination_kpca(data_2,eigvec_2,eigval_2,number_of_pc,options);
data = data_3;
z = zeros(784,100);

% Run the peiyan_kernel_linear_regression.m function

for c = 1:784
    z(c,:) = peiyan_kernel_linear_regression(data,mnist(c,:),data,options);
end

figure;
display_network(z(:,:));

[mssim, ssim_map] = ssim_index(z,mnist);
err = immse(mnist,z);
psnrindex = psnr(z,mnist);