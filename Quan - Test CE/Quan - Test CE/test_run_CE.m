% Randomize the initial population
 pop_arr = randi([-100 100],[10 1]); % Each row is a vector
 
 % Define paras
 PS = size(pop_arr,1);
 dim = size(pop_arr,2);
 DR = rand;
 maxIter = 100;
 Cr = rand; 
 
 % Initialization of D and CP
 [ D, CP ] = initialization(PS,dim,DR);
 
 % Chaotic search
 target = chaotic_search( pop_arr, PS, dim, DR, maxIter, Cr, D, CP);