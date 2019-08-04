function output = fitness_func(input)

load('data.mat', 'train_data', 'train_labels', 'test_data', 'test_labels');

% train 
model = svm.train(train_data, train_labels, input); % input is kernel param for Gaussian kernel SVM
labels_pred = svm.predict(model,test_data);

accurary = mean(test_labels==labels_pred); % output is accuracy

output = -accurary;
