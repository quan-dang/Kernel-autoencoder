clear;

load('quan_mnist.mat');
% display_network(mnist(:,:));

number_of_pc = 10;
parameter = 3.4235e+04;

% 'Options' para for keiyan_pca.m function
options = struct('KernelType','Gaussian','t',parameter);

% Run the peiyan_kpca.m function with imagesR #4 
[eigvec,eigval] = peiyan_kpca(mnist',options);

data = new_coordination_kpca(mnist,eigvec,eigval,number_of_pc,options);

z = zeros(784,100);

% Run the peiyan_kernel_linear_regression.m function

for c = 1:784
    z(c,:) = peiyan_kernel_linear_regression(data,mnist(c,:),data,options);
end

figure;
display_network(z(:,:));

figure;
display_network(mnist(:,:));

[mssim, ssim_map] = ssim_index(z,mnist);
err = immse(mnist,z);
psnrindex = psnr(z,mnist);