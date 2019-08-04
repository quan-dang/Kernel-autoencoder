images = loadMNISTImages('train-images-idx3-ubyte');
labels = loadMNISTLabels('train-labels-idx1-ubyte');

numbers_dataset = zeros(784,1000); 
count_0 = 1;
count_1 = 101;
count_2 = 201;
count_3 = 301;
count_4 = 401;
count_5 = 501;
count_6 = 601;
count_7 = 701;
count_8 = 801;
count_9 = 901;

for c = 1:60000
   if labels(c,:) == 0 
      numbers_dataset(:,count_0) = images(:,c);
      while (count_0 < 100)
         count_0 = count_0+1;
      end
   elseif labels(c,:) == 1 
      numbers_dataset(:,count_1) = images(:,c);
      while (count_1 < 200)
         count_1 = count_1+1;
      end
   elseif labels(c,:) == 2 
      numbers_dataset(:,count_2) = images(:,c);
      while (count_2 < 300)
         count_2 = count_2+1;
      end
   elseif labels(c,:) == 3 
      numbers_dataset(:,count_3) = images(:,c);
      while (count_3 < 400)
         count_3 = count_3+1;
      end
   elseif labels(c,:) == 4 
      numbers_dataset(:,count_4) = images(:,c);
      while (count_4 < 500)
         count_4 = count_4+1;
      end
   elseif labels(c,:) == 5 
      numbers_dataset(:,count_5) = images(:,c);
      while (count_5 < 600)
         count_5 = count_5+1;
      end
   elseif labels(c,:) == 6 
      numbers_dataset(:,count_6) = images(:,c);
      while (count_6 < 700)
         count_6 = count_6+1;
      end
   elseif labels(c,:) == 7 
      numbers_dataset(:,count_7) = images(:,c);
      while (count_7 < 800)
         count_7 = count_7+1;
      end
   elseif labels(c,:) == 8 
      numbers_dataset(:,count_8) = images(:,c);
      while (count_8 < 900)
         count_8 = count_8+1;
      end
   elseif labels(c,:) == 9 
      numbers_dataset(:,count_9) = images(:,c);
      while (count_9 < 1000)
         count_9 = count_9+1;
      end
   end
end

%display_network(numbers_dataset);