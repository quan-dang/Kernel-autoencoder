% each col is a record
function [projected_data] = pca(data)

% Get row and column of data
[~, column] = size(data);

% Compute the mean of data matrix
m= mean(data')';

% Subtract the mean from data matrix
d = data-repmat(m,1,column);

% Compute covariance matrix
covariance = cov(d');

% Compute the eigen values and eigen vectors of the covariance matrix
[eigvector,eigvl]=eig(covariance);

% Sort the eigen vectors according to the eigen values
eigvalue = diag(eigvl);
[~, index] = sort(-eigvalue);
eigvalue(index);
eigvector = abs(eigvector(:, index));

% Project data to new dimension
projected_data = eigvector(:,1:2)'* d;