% Chaotic search function
% Each row is a vector

function [target, fitness_arr, best_individuals, individuals, best_out, best_err_mse, best_err_psnr, best_eigvec_0, best_eigval_0, best_eigvec_1, best_eigval_1, best_z] = chaotic_search(PS, dim, DR, maxIter, Cr, fitness_func)
global initial_flag
initial_flag = 0;
fitness_arr = zeros(maxIter+1, 1);
best_individuals = zeros(maxIter+1, 1); % best individual in each population including the initial population
target = 9000*rand(PS,dim)+1000; % [1000:10000]
individuals = zeros(maxIter+1,PS);

individuals(1,:) = target.';

[initial_out, initial_err_mse, initial_err_psnr, initial_eigvec_0, initial_eigval_0, initial_eigvec_1, initial_eigval_1, initial_z] = fitness_func(target(1,:));
fitness_arr(1,1) = initial_out;
best_individuals(1,1) = target(1,:);
best_out = initial_out; 
best_err_mse = initial_err_mse; 
best_err_psnr = initial_err_psnr; 
best_eigvec_0 = initial_eigvec_0; 
best_eigval_0 = initial_eigval_0; 
best_eigvec_1 = initial_eigvec_1; 
best_eigval_1 = initial_eigval_1; 
best_z = initial_z;

for c = 2:PS
    [c_out, c_err_mse, c_err_psnr, c_eigvec_0, c_eigval_0, c_eigvec_1, c_eigval_1, c_z] = fitness_func(target(c,:));
    if c_out < fitness_arr(1,1)
          fitness_arr(1,1) =  c_out;
          best_individuals(1,1) = target(c,:);
          best_out = c_out;
          best_err_mse = c_err_mse; 
          best_err_psnr = c_err_psnr; 
          best_eigvec_0 = c_eigvec_0; 
          best_eigval_0 = c_eigval_0; 
          best_eigvec_1 = c_eigvec_1; 
          best_eigval_1 = c_eigval_1; 
          best_z = c_z;
    end
end

chaotic = target;
D = zeros(PS,dim);
CP = zeros(PS,dim);

for c = 1:PS
    for d = 1:dim      
      if (rand < DR)
          D(c,d) = -1;
      else 
          D(c,d) = 1;
      end
      CP(c,d) = rand;
    end
end

for g = 2:maxIter+1
    for c = 1:PS
       k = randi(dim);
       % Crossover and mutation
       for d = 1:dim
           if (rand < Cr || d == k)
              chaotic(c,d) = target(c,d)*(1+D(c,d)*CP(c,d));
           end    
       end
       % Selection
       [chaotic_out, ~, ~, ~, ~, ~, ~, ~] = fitness_func(chaotic(c,:));
       [target_out, ~, ~, ~, ~, ~, ~, ~] = fitness_func(target(c,:));
       if chaotic_out < target_out && (chaotic(c,:) > 400) %chaotic(c,:)<400 is not correct because eigval will go wrong.
          target(c,:) = chaotic(c,:);
       end
    end
    % Update D and CP
    for c = 1:PS
        for d = 1:dim
            CP(c,d) = 4*CP(c,d)*(1-CP(c,d)); % Chaotic system logistic map x_n = mu*x_n_1*(1-x_n_1);
            if rand < DR 
                D(c,d) = -1;
            else
                D(c,d) = 1; 
            end
        end
    end
    [initial_out, initial_err_mse, initial_err_psnr, initial_eigvec_0, initial_eigval_0, initial_eigvec_1, initial_eigval_1, initial_z] = fitness_func(target(1,:));
    fitness_arr(g,1) = initial_out;
    best_individuals(g,1) = target(1,:);
    best_out = initial_out; 
    best_err_mse = initial_err_mse; 
    best_err_psnr = initial_err_psnr; 
    best_eigvec_0 = initial_eigvec_0; 
    best_eigval_0 = initial_eigval_0; 
    best_eigvec_1 = initial_eigvec_1; 
    best_eigval_1 = initial_eigval_1; 
    best_z = initial_z;
    
    for c = 2:PS
       [c_out, c_err_mse, c_err_psnr, c_eigvec_0, c_eigval_0, c_eigvec_1, c_eigval_1, c_z] = fitness_func(target(c,:));
       if c_out < fitness_arr(g,1)
          fitness_arr(g,1) =  c_out;
          best_individuals(g,1) = target(c,:);
          best_out = c_out;
          best_err_mse = c_err_mse; 
          best_err_psnr = c_err_psnr; 
          best_eigvec_0 = c_eigvec_0; 
          best_eigval_0 = c_eigval_0; 
          best_eigvec_1 = c_eigvec_1; 
          best_eigval_1 = c_eigval_1; 
          best_z = c_z;
       end
    end
    individuals(g,:) = target.';
end