clear;
load('quan_mnist.mat');

% % Uncomment to run LLE
% Y = lle(mnist,10,10);

% % Uncomment to run Laplacian Eigenmaps
% [Y, ~] = laplacianEigenmaps(mnist', 'NumDimensions', 10);
% Y = Y';

% % Uncomment to run Isomap 
% n_fcn = 'k';
% n_size = 10;
% [Y_temp, R, E] = isomap(mnist, n_fcn, n_size); 
% Y_temp2 = Y_temp.coords(10);
% Y = Y_temp2{1,1};
%  
% % Keep the line of code blow unchanged, for Isomap, LLE, LaplacianEigenmaps, else comment it 
% options = struct('KernelType','Polynomial','d',3);

%% Uncomment to run 2-KPCA
% num_pcs = 10;
% parameter = 6.297872529723556e+02;
% options = struct('KernelType','Gaussian','t',parameter);
% 
% % Run the peiyan_kpca.m function with imagesR #4 
% [eigvec_0,eigval_0] = peiyan_kpca(mnist',options);
% data_1 = new_coordination_kpca(mnist,eigvec_0,eigval_0,size(mnist,2),options);
% [eigvec_1,eigval_1] = peiyan_kpca(data_1',options);
% data_2 = new_coordination_kpca(data_1,eigvec_1,eigval_1,num_pcs,options);
% 
% Y = data_2;

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

figure;
display_network(z(:,:));

[mssim, ssim_map] = ssim_index(z,mnist);
err = immse(mnist,z);
psnrindex = psnr(z,mnist);