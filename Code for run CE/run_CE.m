 % Define paras
 DR = rand;
 Cr = rand; 
 maxIter = 30; % Number of teration 

 PS = 10; % Population size
 dim = 1; % Dimension of individuals
 
 % Chaotic search
 [target, fitness_arr, best_individuals, individuals] = chaotic_search(PS, dim, DR, maxIter, Cr, @fitness_autoencoder);
   
 % plot fitness graph
 x = 1:(maxIter+1);
 y = fitness_arr.';

 figure;
 plot(x,y); % Save as EPS and PNG files

 % save the best fitness value
 best_fitness_value = fitness_arr(maxIter+1,1);
 

 