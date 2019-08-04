for i = 1:size(target,1)
 bias = 120; % Multimodal F13
 
 min_fitness_value = fitness_function(target(1,:));
 for c = 2:size(target,1)
    fitness_value = fitness_function(target(c,:));
    if abs(fitness_value - bias) < abs(min_fitness_value - bias) 
        min_fitness_value =  fitness_value;
    end
 end 
end