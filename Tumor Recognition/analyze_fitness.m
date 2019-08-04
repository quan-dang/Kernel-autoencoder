maxIter = 10;

% plot fitness graph
x = 1:(maxIter+1);
y = zeros(1,maxIter+1);

for k = 1:(maxIter+1)
   y(1,k) = fitness_arr(1,k);
end

figure;
plot(x,y); % Save as EPS and PNG files

% save the best fitness value
best_fitness_value = fitness_arr(1,maxIter+1);
