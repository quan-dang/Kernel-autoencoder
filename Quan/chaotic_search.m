
% Chaotic search function
% Each row is a vector

function target = chaotic_search(target, PS, dim, DR, maxIter, Cr, D, CP)

%mutant = zeros(size(target,1),size(target,2));
%chaotic = zeros(size(target,1),size(target,2));

mutant = zeros(PS,dim);
chaotic = zeros(PS,dim);

for g = 1:maxIter
    for c = 1:PS
       k = randi(dim);
       % Crossover and mutation
       for d = 1:dim
           if ((rand < Cr) || (d == k))
              mutant(c,d) = target(c,d)*(1+D(c,d)*CP(c,d));
              chaotic(c,d) = mutant(c,d);
           else 
              chaotic(c,d) = target(c,d);
           end
           
       end
       % Selection
       %{
       for h = 1:PS
          if fitness_function(chaotic(h,1)) < fitness_function(target(h,1))
             target(h,1) = chaotic(h,1);
          end
       end
       %}
       for d = 1:dim
          if fitness_function(chaotic(c,d)) < fitness_function(target(c,d))
              target(c,d) = chaotic(c,d);
          end
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
    
end