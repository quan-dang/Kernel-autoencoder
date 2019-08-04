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
    
    [eigenvector, eigenvalue] = eig(K);
    eigenvalue = diag(eigenvalue);
    
    [temp, index] = sort(-eigenvalue);
    eigenvalue = eigenvalue(index);
    eigenvector = eigenvector(:,index);
    
  %  for i=1:length(eigenvalue) % normalizing eigenvector
  %      eigenvector(:,i)=eigenvector(:,i)/sqrt(eigenvalue(i));
  %  end
    
    
   
end