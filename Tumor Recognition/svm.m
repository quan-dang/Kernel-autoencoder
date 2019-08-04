classdef svm
    methods (Static)
        % train model 
        % each row of data is one record, each col is one feature
        % labels is one col vector
        function model=train(data, labels, kernel_scale)
            % 1. SVM 
            % Linear: s0.3 - 0.7333; s0.2 - 0.6; s0.1 - 0.8
            % RBF: s0.3 - 0.3333; s0.2 - 0.3333; s0.1 - 0.4
            % PolynomialF: s0.3 - 0.2; s0.2 - 0.2; s0.1 - 0.2
            % t = templateSVM('Standardize', true, 'KernelFunction', 'linear');
            % t = templateSVM('Standardize', true, 'KernelFunction', 'RBF', 'KernelScale', kernel_scale);
            t = templateSVM('Standardize', true, 'KernelFunction', 'polynomial', 'PolynomialOrder', kernel_scale);
            
            
            % 2. KNN
            % size: 0.3; best: 0.7333 
            % size: 0.2; best: 0.75
            % size: 0.1; best: 0.9
            % t = templateKNN('NumNeighbors', 2, 'Standardize', true);
            
            % 3. Discriminant
            % size: 0.3; best: 0.7333
            % size: 0.2; best: 0.65
            % size: 0.1; best: 0.8
            % t = templateDiscriminant('DiscrimType','diaglinear');

            % 4. Linear classification  
            % size: 0.3; best: 0.6667
            % size: 0.2; best: 0.55
            % size: 0.1; best: 0.6
            % rng(1);
            % t = templateLinear();
            
            % 5. Gaussian kernel classification model 
            % size: 0.3; best: 0.6333
            % size: 0.2; best: 0.55
            % size: 0.1; best: 0.6
            % t = templateKernel('Learner', 'svm', 'KernelScale', 300);
            
            % 6. Naive Bayes classifier 
            % size: 0.3; best: 0.1
            % size: 0.2; best: 0.1
            % size: 0.1; best: 0.1
            % t = templateNaiveBayes();
            
            % 7. Tree classifier
            % size: 0.3; best: 0.6333
            % size: 0.2; best: 0.55
            % size: 0.1; best: 0.7
            % t = templateTree('Surrogate','on','MaxNumSplits',1);
            
            % 8. Ensemble learning 
            % size: 0.3; best: 0.1
            % size: 0.2; best: 0.1
            % size: 0.1; best: 0.1
            % rng(1); % For reproducibility
            % tTree = templateTree('Surrogate', 'on', 'MaxNumSplits', 1);
            % t = templateEnsemble('AdaBoostM1', 100, tTree, 'LearnRate', 0.1);

            model = fitcecoc(data, labels, 'Learners', t);
        end
        
        function labels=predict(model, data, varargin)
            labels = predict(model, data);
        end
    end 
end