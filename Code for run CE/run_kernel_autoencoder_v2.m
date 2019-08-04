load('quan_mnist.mat');
% display_network(mnist(:,:));

number_of_pc = 10;
parameter = 5.4668e+03;
% parameter = 2.4102e+03;
% parameter = 4.530890039993868e+02;
% parameter = 4.499190854850039e+02;
% 'Options' para for keiyan_pca.m function
options = struct('KernelType','Gaussian','t',parameter);

%parameter = 5.363680001968917e+03;
%options = struct('KernelType','Gaussian','t',parameter);

% Run the peiyan_kpca.m function with imagesR #4 
[eigvec_0,eigval_0] = peiyan_kpca(mnist',options);
data_1 = new_coordination_kpca(mnist,eigvec_0,eigval_0,100,options);
[eigvec_1,eigval_1] = peiyan_kpca(data_1',options);
data_2 = new_coordination_kpca(data_1,eigvec_1,eigval_1,number_of_pc,options);

data = data_2;
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