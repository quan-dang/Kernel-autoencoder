classdef svm
    methods (Static)
        % train model 
        % each row of data is one record, each col is one feature
        % labels is one col vector
        function model=train(data, labels)
            % 1. SVM 
            % best RBF: 0.1, 0.7278 
            % t = templateSVM('Standardize', true, 'KernelFunction', 'linear');
            % t = templateSVM('Standardize', true, 'KernelFunction', 'RBF', 'KernelScale', 260);
            % t = templateSVM('Standardize', true, 'KernelFunction', 'polynomial', 'PolynomialOrder', 15);
            
            
            % 2. KNN - best: 0.1, 0.7628
            t = templateKNN('NumNeighbors', 2, 'Standardize', true);
            
            % 3. Discriminant
            % t = templateDiscriminant('DiscrimType','diaglinear');

            % 4. Linear classification  
            % rng(1);
            % t = templateLinear();
            
            % 5. Gaussian kernel classification model 
            % t = templateKernel('Learner', 'svm', 'KernelScale', 300);
            
            % 6. Naive Bayes classifier 
            % t = templateNaiveBayes();
            
            % 7. Tree classifier
            % t = templateTree('Surrogate','on','MaxNumSplits',1);
            
            % 8. Ensemble learning 
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