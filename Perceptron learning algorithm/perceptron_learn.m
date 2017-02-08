function [ w iterations ] = perceptron_learn( data_in )
%perceptron_learn Run PLA on the input data
%   Inputs: data_in: Assumed to be a matrix with each row representing an
%                    (x,y) pair, with the x vector augmented with an
%                    initial 1, and the label (y) in the last column
%   Outputs: w: A weight vector (should linearly separate the data if it is
%               linearly separable)
%            iterations: The number of iterations the algorithm ran for
    [n,d] = size(data_in);
    x = data_in(:,1:d-1)';
    y = data_in(:,d)';
    w = zeros(d-1,1);
    iterations=0;
    while ~isempty(find(y.*(w'*x)<=0, 1))
        index = find(y.*(w'*x)<=0, 1);
        w = w + y(index)*x(:,index);
        iterations = iterations+1;        
    end
end

