function eigval_contrib_rate = calculate_distribution(num_of_pcs,kernel_parameter,mnist)

options = struct('KernelType','Gaussian','t',kernel_parameter);
%options = struct('KernelType','Polynomial','d', kernel_parameter);

% Run the peiyan_kpca.m function with imagesR #4 
[~,eigval] = peiyan_kpca(mnist',options);

% Calculate sum of eigvalues
sum_all_eigvals = 0;
for k = 1:size(eigval,1)
    sum_all_eigvals = sum_all_eigvals + eigval(k,:);
end

sum_chosen_eigvals = 0;
for h = 1:num_of_pcs
    sum_chosen_eigvals = sum_chosen_eigvals + eigval(h,:);  
end

eigval_contrib_rate = sum_chosen_eigvals/sum_all_eigvals;