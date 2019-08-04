clear;

% load data, each row is one record
test_size = 0.3;
[train_data, train_labels, test_data, test_labels] = preprocessing(test_size);

save('data', 'train_data', 'train_labels', 'test_data', 'test_labels');

% % train 
% model = svm.train(train_data, train_labels);
% labels_pred = svm.predict(model,test_data);
% 
% accuracy = mean(test_labels==labels_pred);
% fprintf('\nAccuracy: %d\n', accuracy);

 % Define paras
 DR = rand;
 Cr = rand; 
 maxIter = 10; % Number of teration 

 PS = 10; % Population size
 dim = 1; % Dimension of individuals
 
 % Chaotic search
 [target, fitness_arr, best_individuals] = chaotic_search(PS, dim, DR, maxIter, Cr, @fitness_func, @textprogressbar);









