%peiyan @ UoA 
%kenerl method based linear regression
% one column is one vector

function [y]=peiyan_kernel_linear_regression(data,data_labels,x,options)

    [x_m,x_n]=size(x);
    
    if x_n == 1   
      
        [m,n]=size(data);
        K1 = constructKernel(data',[],options);
        oneN1=ones(n,n);
        % To preven K1 go to inf
        K1_prevent_inf = isinf(K1);
        K1_prevent_nan = isnan(K1);
        count_one_inf = 0;
        count_one_nan = 0;
        for c = 1:size(K1_prevent_inf,1)
            for d = 1:size(K1_prevent_inf,2)
                if (K1_prevent_inf(c,d) == 1)
                       count_one_inf = count_one_inf+1;
                end
                if (K1_prevent_nan(c,d) == 1)
                       count_one_nan = count_one_nan+1;
                end
            end
        end
        if (count_one_inf > 0) || ( count_one_nan > 0) 
              K1 = ones(size(K1_prevent_inf,1),size(K1_prevent_inf,2)); 
        end
        my_alpha=pinv(oneN1+K1)*data_labels';
    
        K2 = constructKernel(data',x',options);
        oneN2=ones(1,x_m);
        y=(oneN2+K2')*my_alpha;
    
    else
        for i=1:x_n
           
           [m,n]=size(data);
           K1 = constructKernel(data',[],options);
           oneN1=ones(n,n);
           % To preven K1 go to inf
           K1_prevent_inf = isinf(K1);
           K1_prevent_nan = isnan(K1);
           count_one_inf = 0;
           count_one_nan = 0;
           for c = 1:size(K1_prevent_inf,1)
               for d = 1:size(K1_prevent_inf,2)
                   if (K1_prevent_inf(c,d) == 1)
                       count_one_inf = count_one_inf+1;
                   end
                   if (K1_prevent_nan(c,d) == 1)
                       count_one_nan = count_one_nan+1;
                   end
               end
           end
           if (count_one_inf > 0) || ( count_one_nan > 0) 
              K1 = ones(size(K1_prevent_inf,1),size(K1_prevent_inf,2)); 
           end
           
           my_alpha=pinv(oneN1+K1)*data_labels'; 
           
           K2 = constructKernel(data',x(:,i)',options);
           oneN2=ones(1,x_n);
           y_temp(i) =(oneN2+K2')*my_alpha; 
        end
    end
y=y_temp;
end