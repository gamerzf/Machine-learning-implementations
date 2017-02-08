function [ overfit_m ] = computeOverfitMeasure( true_Q_f, N_train, N_test, var, num_expts )
%COMPUTEOVERFITMEASURE Compute how much worse H_10 is compared with H_2 in
%terms of test error. Negative number means it's better.
%   Inputs
%       true_Q_f: order of the true hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       var: variance of the stochastic noise
%       num_expts: number of times to run the experiment
%   Output
%       overfit_m: vector of length num_expts, reporting each of the
%                  differences in error between H_10 and H_2
 overfit_m = zeros(1, num_expts);
    for i = 1:num_expts
        [train, ] = generate_dataset(true_Q_f, N_train, N_test, sqrt(var));
        g2 = glmfit(computeLegPoly(transpose(train(:,1)), 2),train(:,2),'normal','constant','false');
        g10 = glmfit(computeLegPoly(transpose(train(:,1)), 10),train(:,2),'normal','constant','false');
        Eg2 = 1 + var + sum(transpose((g2.^2)).*(2*(0:2) + 1).^-1);
        Eg10 = 1 + var + sum(transpose((g10.^2)).*(2*(0:10) + 1).^-1);
        overfit_m(i) = Eg10 - Eg2;
    end


end

