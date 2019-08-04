function out = fitness_autoencoder_v3(in)

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
if (sum(isnan(eigvec_0(:))) == 0) && (sum(isinf(eigvec_0(:))) == 0) && (sum(isnan(eigval_0(:))) == 0) && (sum(isinf(eigval_0(:))) == 0)
    data_1 = new_coordination_kpca(mnist,eigvec_0,eigval_0,100,options);
    [eigvec_1,eigval_1] = peiyan_kpca(data_1',options);
        
    if (sum(isnan(eigvec_1(:))) == 0) && (sum(isinf(eigvec_1(:))) == 0) && (sum(isnan(eigval_1(:))) == 0) && (sum(isinf(eigval_1(:))) == 0)
        data_2 = new_coordination_kpca(data_1,eigvec_1,eigval_1,100,options);
        [eigvec_2,eigval_2] = peiyan_kpca(data_2',options);
        
        if (sum(isnan(eigvec_2(:))) == 0) && (sum(isinf(eigvec_2(:))) == 0) && (sum(isnan(eigval_2(:))) == 0) && (sum(isinf(eigval_2(:))) == 0)
            data_3 = new_coordination_kpca(data_2,eigvec_2,eigval_2,number_of_pc,options);
            data = data_3;
            
            % Restore the image using kernel-based linear regression
            z = zeros(784,100);
            for c = 1:784
                z(c,:) = peiyan_kernel_linear_regression(data,mnist(c,:),data,options);
            end
            
            [mssim,x] = ssim_index(z,mnist); % MSSIM index BIG
            out = -mssim; 
        else
            out = 0;
        end
    else
        out = 0;
    end

else
    out = 0;
end

%err = immse(mnist,z);                    % Least mean square err?@SMALL
%out = err;

%peaksnr = psnr(z, mnist);         % Peak Signal-to-Noise Ratio (PSNR) BIG
%out = -peaksnr;
