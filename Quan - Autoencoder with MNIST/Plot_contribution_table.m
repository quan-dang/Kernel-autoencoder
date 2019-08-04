
% Plot the contribution table of eival

% X-axis is eigenvalue number, in the range of 1..size(eigval,1)
X = 1:size(eigval,1);

% Y-axis is the contribution corresponding to X_axis, in the range of 1..size(eigval,1)
Y = zeros(1,size(eigval,1));

% Sum of all eigenval
sum_eigval = 0;

% Calculate sum of all eigenval
for d = 1:size(eigval,1)
   sum_eigval = sum_eigval + eigval(d,:);
end

% Calculate the contribution of eigvals
for c = 1:size(eigval,1)
    Y(:,c) = eigval(c,:)/sum_eigval;
end

figure;
plot(X,Y);
title('Contribution table of eigval');
xlabel('Eigenvalue number');
ylabel("Eigen value's contribution");