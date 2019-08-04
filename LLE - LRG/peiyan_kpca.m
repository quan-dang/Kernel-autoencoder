%peiyan @ UoA 
%kenerl based PCA
% one row is one vector for input parameter data
% eigenvector is a colunm vector

function [ eigenvector,eigenvalue ]= peiyan_kpca(data,options)

    K0 = constructKernel(data,[],options);
    
    %transfer K with zero mean
    [N,m]=size(K0);
    oneN=ones(N,N)/N;
    K=K0-oneN*K0-K0*oneN+oneN*K0*oneN;
    
    if (sum(isnan(K(:))) == 0) && (sum(isinf(K(:))) == 0)
        [eigenvector, eigenvalue] = eig(K);
        eigenvalue = diag(eigenvalue);
        
        if isreal(eigenvalue)
            [temp, index] = sort(-eigenvalue);
        else
            eigenvalue = real(eigenvalue);
            [temp, index] = sort(-eigenvalue);
            
        end
        
        [temp, index] = sort(-eigenvalue);
        eigenvalue = eigenvalue(index);
        eigenvector = eigenvector(:,index);
    else
        eigenvalue = NaN(N,1);
        eigenvector = NaN(N);
    end
end