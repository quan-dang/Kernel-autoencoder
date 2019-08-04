% Create some data

eigen_vector_number = 0:100;

sum_eigval = 0;

for d = 1:100
    sum_eigval = sum_eigval + eigval(d,:); 
end

eigenvalue_vector = zeros(1,100);

for c = 1:100
     eigenvalue_vector(c) = eigval(c,:)/sum_eigval;
end
% Create a y-axis semilog plot using the semilogy function
% Plot SER data in blue and BER data in red
figure
semilogy( eigenvalue_vector, eigenvalue_vector, 'bo-')

% Turn on the grid
grid on

% Add title and axis labels
title('Contribution graph')
xlabel('Eigenvalue number')
ylabel('Eigenvalue divided by sum')