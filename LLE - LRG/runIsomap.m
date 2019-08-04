clear;
load('quan_mnist.mat');

n_fcn = 'k';
n_size = 10;
[Y_temp, R, E] = isomap(mnist, n_fcn, n_size); 
Y_temp2 = Y_temp.coords(10);
Y = Y_temp2{1,1};
options = struct('KernelType','Polynomial','d',3);

z = zeros(784,100);

% Run the peiyan_kernel_linear_regression.m function

for c = 1:784
    z(c,:) = peiyan_kernel_linear_regression(Y,mnist(c,:),Y,options);
end

figure;
display_network(z(:,:));

[mssim, ssim_map] = ssim_index(z,mnist);
err = immse(mnist,z);
psnrindex = psnr(z,mnist);