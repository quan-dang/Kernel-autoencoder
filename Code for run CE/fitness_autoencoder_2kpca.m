function [out, err_mse, err_psnr, eigvec_0, eigval_0, eigvec_1, eigval_1, z] = fitness_autoencoder_2kpca(in)

% Generate new_data_mnist data
load('quan_mnist');

%% Uncomment to run 2-KPCA
num_pcs = 10;
options = struct('KernelType','Gaussian','t',in);

% Run the peiyan_kpca.m function with imagesR #4 
[eigvec_0,eigval_0] = peiyan_kpca(mnist',options);
data_1 = new_coordination_kpca(mnist,eigvec_0,eigval_0,size(mnist,2),options);
[eigvec_1,eigval_1] = peiyan_kpca(data_1',options);
data_2 = new_coordination_kpca(data_1,eigvec_1,eigval_1,num_pcs,options);

Y = data_2;

%% Uncomment to run KDA
% parameter = 4.390712708754534e+02;
% options =  struct('KernelType','Gaussian','t',parameter);
% [eigvec, eigval] = KDA(options, labels_mnist', mnist');
% K0 = constructKernel(mnist',[],options);
% Y = K0*eigvec;

%% Keep the code below unchanged

z = zeros(784,100);

% Run the peiyan_kernel_linear_regression.m function

for c = 1:784
    z(c,:) = peiyan_kernel_linear_regression(Y,mnist(c,:),Y,options);
end

[mssim, ssim_map] = ssim_index(z,mnist);
% err = immse(mnist,z);
% psnrindex = psnr(z,mnist);
out = -mssim;
err_mse = immse(mnist,z);              
err_psnr = psnr(z, mnist);
