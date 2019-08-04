clear;

load('quan_mnist.mat');

pcs = 1:50; % 100 principal components 
distribution_before = zeros(1,10); % distribution rate for the initial parameter
distribution_after = zeros(1,10); % distribution rate for the tuned parameter

distance_table_before = zeros(10,10);
distance_table_after = zeros(10,10);

% Version 2
% kernel_parameter_before=8.8783e+03;kernel_parameter_after=4.1237e+04;%MSE-1
% kernel_parameter_before=9.9585e+03;kernel_parameter_after=3.3290e+04;%MSE-10
% kernel_parameter_before=1.2873e+03;kernel_parameter_after=1.4669e+03;%SSIM-1
% kernel_parameter_before=2.0729e+03;kernel_parameter_after=2.6844e+03;%SSIM-10
% kernel_parameter_before=8.0240e+03;kernel_parameter_after=4.9258e+04;%PSNR-1
% kernel_parameter_before=9.6268e+03;kernel_parameter_after=2.9173e+04;%PSNR-10

% Version 3
% kernel_parameter_before=9.7353e+03;kernel_parameter_after=2.0197e+04;%MSE-1
% kernel_parameter_before=9.9585e+03;kernel_parameter_after=3.3290e+04;%MSE-10
% kernel_parameter_before=1.2873e+03;kernel_parameter_after=1.4669e+03;%SSIM-1
% kernel_parameter_before=2.1664e+03;kernel_parameter_after=2.4281e+03;%SSIM-10
% kernel_parameter_before=8.0240e+03;kernel_parameter_after=4.9258e+04;%PSNR-1
% kernel_parameter_before=9.6268e+03;kernel_parameter_after=2.9173e+04;%PSNR-10

% Version 4
% kernel_parameter_before=9.7353e+03;kernel_parameter_after=3.4755e+04;%MSE-1
% kernel_parameter_before=9.6124e+03;kernel_parameter_after=3.5336e+04;%MSE-10
% kernel_parameter_before=2.0543e+03;kernel_parameter_after=1.4844e+03;%SSIM-1
% kernel_parameter_before=2.4185e+03;kernel_parameter_after=2.4097e+03;%SSIM-10
% kernel_parameter_before=9.6124e+03;kernel_parameter_after=5.2435e+04;%PSNR-1
% kernel_parameter_before=9.9953e+03;kernel_parameter_after=3.5235e+04;%PSNR-10

% Version last
% kernel_parameter_before=9.7735e+03;kernel_parameter_after=5.1039e+04;%MSE-1
% kernel_parameter_before=7.7510e+03;kernel_parameter_after=3.3078e+04;%MSE-10

% kernel_parameter_before=3.3399e+03;kernel_parameter_after=2.4022e+03;%SSIM-1v2
% kernel_parameter_before=2.6108e+03;kernel_parameter_after=2.4001e+03;%SSIM-10v2

% kernel_parameter_before=1.2368e+03;kernel_parameter_after=1.4990e+03;%SSIM-1v3
% kernel_parameter_before=3.3399e+03;kernel_parameter_after=2.4022e+03;%SSIM-10v3

% kernel_parameter_before=3.2973e+03;kernel_parameter_after=1.4865e+03;%SSIM-1v4
% kernel_parameter_before=1.9522e+03;kernel_parameter_after=2.4102e+03;%SSIM-10v4

% kernel_parameter_before=8.6679e+03;kernel_parameter_after=4.3379e+04;%PSNR-1
% kernel_parameter_before=8.4217e+03;kernel_parameter_after=3.4235e+04;%PSNR-10

for k = 1:size(pcs,2)
   distribution_before(:,k) = calculate_distribution(k,kernel_parameter_before,mnist); 
   distribution_after(:,k) = calculate_distribution(k,kernel_parameter_after,mnist);
end

for k = 1:10
    for h = 1:10
       distance_table_before(k,h) = calculate_distance(mnist(:,(k*10-9):(k*10)),...
                                                       mnist(:,(h*10-9):(h*10)),...
                                                       kernel_parameter_before);
                                                   
       distance_table_after(k,h) = calculate_distance(mnist(:,(k*10-9):(k*10)),...
                                                       mnist(:,(h*10-9):(h*10)),...
                                                       kernel_parameter_after);
    end
end

distance_table_change = distance_table_after - distance_table_before; % this matrix should be positive

figure;
plot(pcs,distribution_before,pcs,distribution_after,'--');

title('Distribution of eigenvalues - ten principle components');
xlabel('Number of principle components');
ylabel('Distribution of eigenvalues');
legend('before','after')
