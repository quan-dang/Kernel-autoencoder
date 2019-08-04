I1 = imread('lena.png');
I1 = double(I1);
I1 = reshape(I1,[],1);
% display_network(mnist(:,:));

I2 = imread('boat.png');
I2 = double(I2);
I2 = reshape(I2,[],1);

I3 = imread('barbara.png');
I3 = double(I3);
I3 = reshape(I3,[],1);

I4 = imread('fingerprint.png');
I4 = double(I4);
I4 = reshape(I4,[],1);

I5 = imread('flinstones.png');
I5 = double(I5);
I5 = reshape(I5,[],1);

mnist = horzcat(I1,I2,I3,I4,I5);
[m,n] = size(mnist);

num_data = 3;

number_of_pc = 1;
parameter = 3;

% 'Options' para for keiyan_pca.m function
options = struct('KernelType','Polynomial','d',parameter);

%parameter = 5.363680001968917e+03;
%options = struct('KernelType','Gaussian','t',parameter);

% Run the peiyan_kpca.m function with imagesR #4 
[eigvec_0,eigval_0] = peiyan_kpca(mnist',options);

data_1 = new_coordination_kpca(mnist,eigvec_0,eigval_0,n,options);

[eigvec_1,eigval_1] = peiyan_kpca(data_1',options);

data_2 = new_coordination_kpca(data_1,eigvec_1,eigval_1,number_of_pc,options);

data = data_2;
z = zeros(m,n);

% Run the peiyan_kernel_linear_regression.m function

for c = 1:m
    z(c,:) = peiyan_kernel_linear_regression(data,mnist(c,:),data,options);
end

image(reshape(z(:,1),[512,512]));


