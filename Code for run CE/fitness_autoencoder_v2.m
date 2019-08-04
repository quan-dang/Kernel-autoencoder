function [out, err_mse, err_psnr, eigvec_0, eigval_0, eigvec_1, eigval_1, z] = fitness_autoencoder_v2(in)

% 'Options' para for keiyan_pca.m function
options = struct('KernelType','Gaussian','t',in);

% Generate new_data_mnist data
load('quan_mnist');

% Run the peiyan_kpca.m function with imagesR #4 
% [eigvec,eigval] = peiyan_kpca(mnist',options);

% Number of principle components retained
number_of_pc = 10;

% Run the peiyan_kpca.m function with imagesR #4 
[eigvec_0,eigval_0] = peiyan_kpca(mnist',options);
if (sum(isnan(eigvec_0(:))) == 0) && (sum(isinf(eigvec_0(:))) == 0) && (sum(isnan(eigval_0(:))) == 0) && (sum(isinf(eigval_0(:))) == 0) && (eigval_0(100) > 0)
    data_1 = new_coordination_kpca(mnist,eigvec_0,eigval_0,100,options);
    [eigvec_1,eigval_1] = peiyan_kpca(data_1',options);
        
    if (sum(isnan(eigvec_1(:))) == 0) && (sum(isinf(eigvec_1(:))) == 0) && (sum(isnan(eigval_1(:))) == 0) && (sum(isinf(eigval_1(:))) == 0) 
        data_2 = new_coordination_kpca(data_1,eigvec_1,eigval_1,number_of_pc,options);
        data = data_2;
            
        % Restore the image using kernel-based linear regression
        z = zeros(784,100);
        for c = 1:784
            z(c,:) = peiyan_kernel_linear_regression(data,mnist(c,:),data,options);
        end
        
        [mssim,~] = ssim_index(z,mnist); % MSSIM index BIG
        out = -mssim; 
        err_mse = immse(mnist,z);                    % Least mean square err?@SMALL
        err_psnr = psnr(z, mnist);
    else
        out = exp(1000);
        err_mse = exp(1000);
        err_psnr = exp(1000);
        eigvec_1 = eigvec_0; 
        eigval_1 = eigvec_1; 
        z = ones(size(mnist));
    end

else
    out = exp(1000);
    err_mse = exp(1000);
    err_psnr = exp(1000);
    eigvec_1 = eigvec_0; 
    eigval_1 = eigvec_1; 
    z = ones(size(mnist));
end

%err = immse(mnist,z);                    % Least mean square err?@SMALL
%out = err;

%peaksnr = psnr(z, mnist);         % Peak Signal-to-Noise Ratio (PSNR) BIG
%out = -peaksnr;
