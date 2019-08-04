% Load MNIST Dataset
%images = loadMNISTImages('train-images-idx3-ubyte');
load new_data_mnist

% 'Options' para for keiyan_pca.m function
options = struct('KernelType','Gaussian','t',900);

% Run the peiyan_kpca.m function with imagesR #4 
[eigvec,eigval] = peiyan_kpca(new_data_mnist',options);

% Show image
% display_network(new_data_mnist(:,:));
