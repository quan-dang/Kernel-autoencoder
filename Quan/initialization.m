% D and CP initialization function
% PS: Population size, dim: dimension of each individual
% DR: direction factor rate (random value) 

function [ D, CP ] = initialization(PS,dim,DR)
   
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
