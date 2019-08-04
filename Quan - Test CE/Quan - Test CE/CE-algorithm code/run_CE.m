 % Define paras
 DR = rand;
 Cr = rand; 
 times_rand_state = 30; % 30 times changing rand 'state'
 index_func = 10; % Index function for benchmark_func
 maxIter = 1000; % Number of teration 

 PS = 10; % Population size
 dim = 10; % Dimension of individuals
 average_fitness = zeros(maxIter, 1); % To calculate average fitness over 30 times changing rand state
 
 % Chaotic search
 for rand_state_number = 1:times_rand_state
    [target, fitness_arr] = chaotic_search(PS, dim, DR, maxIter, Cr, @benchmark_func, index_func, rand_state_number);
    average_fitness = average_fitness + fitness_arr; 
 end
 
 average_fitness = average_fitness./30;
 plot(average_fitness);
 

 