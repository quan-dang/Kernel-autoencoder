% test_size from 0 -> 1
% function to devide training and testing datasets
function [train_data, train_labels, test_data, test_labels] = preprocessing(test_size)
rng(42);

% define a test size
neg_struct = dir(['./data/negative' '/*.png']);
neg_size = size(neg_struct, 1);
lpos_struct = dir(['./data/positive/large' '/*.png']);
lpos_size = size(lpos_struct, 1);
mpos_struct = dir(['./data/positive/middle' '/*.png']);
mpos_size = size(mpos_struct, 1);

neg_data = zeros(neg_size, 4096);
for ni = 1:neg_size
    img = double(imread(strcat(neg_struct(ni).folder,'/',neg_struct(ni).name)));
    img_vec = reshape(img, 1, []);
    neg_data(ni, :) = img_vec;
end

lpos_data = zeros(lpos_size, 4096);
for ni = 1:lpos_size
    img = double(imread(strcat(lpos_struct(ni).folder,'/',lpos_struct(ni).name)));
    img_vec = reshape(img, 1, []);
    lpos_data(ni, :) = img_vec;
end

mpos_data = zeros(mpos_size, 4096);
for ni = 1:mpos_size
    img = double(imread(strcat(mpos_struct(ni).folder,'/',mpos_struct(ni).name)));
    img_vec = reshape(img, 1, []);
    mpos_data(ni, :) = img_vec;
end

% labels = ones(size(data, 1), 1);
% labels(1:neg_size, :) = 0 * labels(1:neg_size, :);
% labels(neg_size+1:neg_size+lpos_size, :) = 1 * labels(neg_size+1:neg_size+lpos_size, :);
% labels(neg_size+lpos_size+1:size(data, 1), :) = 2 * labels(neg_size+lpos_size+1:size(data, 1), :);

neg_data = neg_data(randperm(size(neg_data,1)), :);
lpos_data = lpos_data(randperm(size(lpos_data,1)), :);
mpos_data = mpos_data(randperm(size(mpos_data,1)), :);

neg_test = neg_data(1:ceil(neg_size*test_size),:);
neg_test_labels = 0 * ones(ceil(neg_size*test_size),1);
neg_train = neg_data(ceil(neg_size*test_size)+1:neg_size,:);
neg_train_labels = 0 * ones(neg_size-ceil(neg_size*test_size),1);


lpos_test = lpos_data(1:ceil(lpos_size*test_size),:);
lpos_test_labels = 1 * ones(ceil(lpos_size*test_size),1);
lpos_train = lpos_data(ceil(lpos_size*test_size)+1:lpos_size,:);
lpos_train_labels = 1 * ones(lpos_size-ceil(lpos_size*test_size),1);

mpos_test = mpos_data(1:ceil(mpos_size*test_size),:);
mpos_test_labels = 2 * ones(ceil(mpos_size*test_size),1);
mpos_train = mpos_data(ceil(mpos_size*test_size)+1:mpos_size,:);
mpos_train_labels = 2 * ones(mpos_size-ceil(mpos_size*test_size),1);

% data = [neg_data; lpos_data; mpos_data];
train_data = [neg_train; lpos_train; mpos_train];
train_labels = [neg_train_labels; lpos_train_labels; mpos_train_labels];
test_data = [neg_test; lpos_test; mpos_test];
test_labels = [neg_test_labels; lpos_test_labels; mpos_test_labels];
% save('data', 'neg_data', 'lpos_data', 'mpos_data', 'data');


