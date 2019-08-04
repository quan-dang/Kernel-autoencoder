function accurary = fitness_autoencoder(kernel_scale)

% train 
model = svm.train(train_data, train_labels, kernel_scale);
labels_pred = svm.predict(model,test_data);

accurary = mean(test_labels==labels_pred); % output is accuracy
