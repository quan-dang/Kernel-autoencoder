%peiyan @ UoA 
%kenerl method based linear regression
% one column is one vector

function [y]=peiyan_kernel_linear_regression(data,data_labels,x,options)

    [x_m,x_n]=size(x);
    
    if x_n == 1   
      
        [m,n]=size(data);
        K1 = constructKernel(data',[],options);
        oneN1=ones(n,n);
        my_alpha=pinv(oneN1+K1)*data_labels';
    
        K2 = constructKernel(data',x',options);
        oneN2=ones(1,x_m);
        y=(oneN2+K2')*my_alpha;
    
    else
        
        for i=1:x_n
           
           [m,n]=size(data);
           K1 = constructKernel(data',[],options);
           oneN1=ones(n,n);
           my_alpha=pinv(oneN1+K1)*data_labels'; 
           
           K2 = constructKernel(data',x(:,i)',options);
           oneN2=ones(1,x_n);
           y_temp(i) =(oneN2+K2')*my_alpha; 
            
        end
        y=y_temp;
      
    end
end