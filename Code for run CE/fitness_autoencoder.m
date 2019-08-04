function out = fitness_autoencoder(in)

% 'Options' para for keiyan_pca.m function
options = struct('KernelType','Gaussian','t',in);

% Generate new_data_mnist data
load('quan_mnist');

% Run the peiyan_kpca.m function with imagesR #4 
[eigvec,eigval] = peiyan_kpca(mnist',options);

% Number of principle components retained
number_of_pc = 1;
data = new_coordination_kpca(mnist,eigvec,eigval,number_of_pc,options);

% Restore the image using kernel-based linear regression
z = zeros(784,100);
for c = 1:784
    z(c,:) = peiyan_kernel_linear_regression(data,mnist(c,:),data,options);
end

%[mssim,x] = ssim_index(z,mnist); % MSSIM index BIG
%out = -mssim;

err = immse(mnist,z);                    % Least mean square err?@SMALL
out = err;

%peaksnr = psnr(z, mnist);         % Peak Signal-to-Noise Ratio (PSNR) BIG
%out = -peaksnr;

