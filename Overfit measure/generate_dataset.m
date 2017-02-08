function [ train_set test_set ] = generate_dataset( Q_f, N_train, N_test, sigma )
%GENERATE_DATASET Generate training and test sets for the Legendre
%polynomials example
%   Inputs:
%       Q_f: order of the hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       sigma: standard deviation of the stochastic noise
%   Outputs:
%       train_set and test_set are both 2-column matrices in which each row
%       represents an (x,y) pair
 train = rand(1, N_train);
    err_train = randn(1, N_train);
    test = rand(1, N_test);
    err_test = randn(1, N_test);
    
    train = 2 * train - 1;
    test = 2 * test - 1;
    
    coe = randn(1, Q_f + 1);
    n_coe = sqrt(sum((2*(0:Q_f) + 1).^-1));
    
    y_train = (computeLegPoly(train, Q_f)*transpose(coe) + sigma*transpose(err_train))/n_coe;
    y_test = (computeLegPoly(test, Q_f)*transpose(coe) + sigma*transpose(err_test))/n_coe;
    train_set = [transpose(train) y_train];
    test_set = [transpose(test) y_test];

end

