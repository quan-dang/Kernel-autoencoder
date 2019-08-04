% Define paras
 DR = rand;
 Cr = rand; 
 maxIter = 10; % Number of teration 

 PS = 10; % Population size
 dim = 1; % Dimension of individuals
 
 % Chaotic search
 [target, fitness_arr] = chaotic_search(PS, dim, DR, maxIter, Cr, @fitness_autoencoder);

 