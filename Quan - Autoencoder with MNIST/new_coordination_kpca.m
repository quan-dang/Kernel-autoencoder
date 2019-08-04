% one column is a vector for data
function [new_data_coor] = new_coordination_kpca(data,eigvec,eigval,pca_number,options)

% New data coordination
new_data_coor = zeros(pca_number,size(data,2));

for data_point_number = 1:size(data,2)  
    K_vector = zeros(size(data,2),1);
    for c = 1:size(data,2)
      K_vector(c,1) = constructKernel(data(:,c)',data(:,data_point_number)',options);
   end
   % K_vector  = constructKernel(data(:,:)',data(:,data_point_number)',options);
   for d = 1:pca_number
      new_data_coor(d,data_point_number) = 1/sqrt(eigval(d,:)) * eigvec(:,d)' * K_vector; 
   end
   
end