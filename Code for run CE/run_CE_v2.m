 % Define paras
 DR = rand;
 Cr = rand; 
 maxIter = 100; % Number of teration 

 PS = 10; % Population size
 dim = 1; % Dimension of individuals
 
 % Chaotic search
 [target, fitness_arr, best_individuals, individuals, best_out, best_err_mse, best_err_psnr, best_eigvec_0, best_eigval_0, best_eigvec_1, best_eigval_1, best_z] = chaotic_search(PS, dim, DR, maxIter, Cr, @fitness_autoencoder_v2);
   
 % plot fitness graph
 x = 1:(maxIter+1);
 y = fitness_arr.';

 figure;
 plot(x,y); % Save as EPS and PNG files

 figure;
 display_network(best_z(:,:));
 % save the best fitness value
 % best_fitness_value = fitness_arr(maxIter+1,1);
 

 