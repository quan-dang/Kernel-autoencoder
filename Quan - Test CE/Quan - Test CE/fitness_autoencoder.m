function out = fitness_autoencoder(in)

% 'Options' para for keiyan_pca.m function
options = struct('KernelType','Gaussian','t',in);

% Generate new_data_mnist data
load('new_data_mnist');



% Run the peiyan_kpca.m function with imagesR #4 
[eigvec,eigval] = peiyan_kpca(new_data_mnist',options);

% Number of principle components retained
number_of_pc = 1;
data = new_coordination_kpca(new_data_mnist,eigvec,eigval,number_of_pc,options);

% Restore the image using kernel-based linear regression
z = zeros(784,100);
for c = 1:784
    z(c,:) = peiyan_kernel_linear_regression(data,new_data_mnist(c,:),data,options);
end

%[mssim,x] = ssim_index(z,new_data_mnist); % MSSIM index BIG
% err = immse(new_data_mnist,z);                    % Least mean square errÅ@SMALL
peaksnr = psnr(z, new_data_mnist);         % Peak Signal-to-Noise Ratio (PSNR) BIG

out = -peaksnr;
