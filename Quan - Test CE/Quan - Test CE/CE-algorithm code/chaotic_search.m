
% Chaotic search function
% Each row is a vector

function [target, fitness_arr] = chaotic_search(PS, dim, DR, maxIter, Cr, fitness_func, index_func, rand_state_number)
global initial_flag
initial_flag = 0;
fitness_arr = zeros(maxIter, 1);

switch(index_func)
    case {1, 2, 3, 4, 5, 6}
         rand('state',rand_state_number);
         target = -100 + 200*rand(PS,dim); % [-100:100]
    case 7
         rand('state',rand_state_number);
         target = 600*rand(PS,dim); %[0:600]
    case 8
         rand('state',rand_state_number);
         target = -32 + 64*rand(PS,dim); %[-32:32]
    case {9,10}
         rand('state',rand_state_number);
         target = -5 + 10*rand(PS,dim); %[-5:5]
    otherwise
         disp('index_func invalid!');
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

for g = 1:maxIter
    for c = 1:PS
       k = randi(dim);
       % Crossover and mutation
       for d = 1:dim
           if (rand < Cr || d == k)
              chaotic(c,d) = target(c,d)*(1+D(c,d)*CP(c,d));
           end    
       end
       % Selection
       if fitness_func(chaotic(c,:),index_func) < fitness_func(target(c,:),index_func) 
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
    fitness_arr(g,1) = min(fitness_func(target(:,:),index_func));
end