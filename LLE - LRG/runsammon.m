clear;
load('quan_mnist.mat');

[Y, ~] = sammon(mnist', 10);
options = struct('KernelType','Polynomial','d',3);

z = zeros(784,100);

% Run the peiyan_kernel_linear_regression.m function

for c = 1:784
    z(c,:) = peiyan_kernel_linear_regression(Y',mnist(c,:),Y',options);
end

figure;
display_network(z(:,:));

[mssim, ssim_map] = ssim_index(z,mnist);
err = immse(mnist,z);
psnrindex = psnr(z,mnist);