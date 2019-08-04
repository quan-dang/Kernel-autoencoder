
% Chaotic search function
% Each row is a vector

function [target, fitness_arr] = chaotic_search(PS, dim, DR, maxIter, Cr, fitness_func)
global initial_flag
initial_flag = 0;
fitness_arr = zeros(maxIter+1, 1);
target = 9000*rand(PS,dim)+1000; % [1000:10000]

fitness_arr(1,1) = fitness_func(target(1,:));
for c = 1:PS
    if fitness_func(target(c,:)) < fitness_arr(1,1)
          fitness_arr(1,1) =  fitness_func(target(c,:));
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
       if fitness_func(chaotic(c,:)) < fitness_func(target(c,:)) && (chaotic(c,:) > 400)
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
    fitness_arr(g,1) = fitness_func(target(1,:));
    for c = 1:PS
       if fitness_func(target(c,:)) < fitness_arr(g,1)
          fitness_arr(g,1) =  fitness_func(target(c,:));
       end
    end
end