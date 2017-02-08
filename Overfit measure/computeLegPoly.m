function [ z ] = computeLegPoly( x, Q )
%COMPUTELEGPOLY Return the Qth order Legendre polynomial of x
%   Inputs:
%       x: vector (or scalar) of reals in [-1, 1]
%       Q: order of the Legendre polynomial to compute
%   Output:
%       z: matrix where each column is the Legendre polynomials of order 0 
%          to Q, evaluated atthe corresponding x value in the input
 L = length(x);
    z = zeros(L, Q+1);
    z(:,1) = 1;
    z(:,2) = transpose(x);
    for i = 3:Q+1
        k = i-1;
        z(:,i) = (2*k-1)*(transpose(x).*z(:,i-1))/k - (k-1)*z(:,i-2)/k;
    end


end

