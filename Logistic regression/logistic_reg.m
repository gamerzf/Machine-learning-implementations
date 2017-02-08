function [ w_init, e_in ] = logistic_reg( X, y, w_init, max_its, eta )
%LOGISTIC_REG Learn logistic regression model using gradient descent
%   Inputs:
%       X : data matrix (without an initial column of 1s)
%       y : data labels (plus or minus 1)
%       w_init: initial value of the w vector (d+1 dimensional)
%       max_its: maximum number of iterations to run for
%       eta: learning rate
    
%   Outputs:
%       w : weight vector
%       e_in : in-sample error (as defined in LFD)
[N, ~] = size(X);
X = [ones(N, 1) X];

temp = y'./(1 + exp(y'.*(w_init'*X')));
gradient = (-1)*X'*temp'/N;

t = 1;
while(t <= max_its)&&(max(gradient) > 10^-6)
    w_init = w_init - eta * gradient;
    temp = y'./(1 + exp(y'.*(w_init'*X')));
    gradient = (-1)*X'*temp'/N;
    
    t  = t + 1;
end

e_in = sum(log(1 + exp((-1)*y'.*(w_init'*X'))),2)/N;

end

