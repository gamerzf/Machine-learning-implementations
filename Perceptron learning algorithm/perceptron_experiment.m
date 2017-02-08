function [ num_iters bounds] = perceptron_experiment ( N, d, num_samples )
%perceptron_experiment Code for running the perceptron experiment in HW1
%   Inputs: N is the number of training examples
%           d is the dimensionality of each example (before adding the 1)
%           num_samples is the number of times to repeat the experiment
%   Outputs: num_iters is the # of iterations PLA takes for each sample
%            bound_minus_ni is the difference between the theoretical bound
%               and the actual number of iterations
%      (both the outputs should be num_samples long)

 N=100;d=10;num_samples=1000;
    
  num_iters=zeros(1,num_samples);
  for i = 1:num_samples
   wstarprep = rand([d,1]); 
   wstar = [0;wstarprep]; 
   xprep=-1+2*rand([d,N]);
   x=[xprep;ones(1,N)];
   y=sign(wstar'*x);
   data_in=[x;y]';   
      
   [w ,iterations] = perceptron_learn(data_in);
   num_iters(i)=iterations;
  end

end

