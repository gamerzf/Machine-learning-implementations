function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
	%% fill in code here
    n = size(X,2);
    v1 = X'*X;
    v2 = diag(v1);
    v = repmat(v2,1,n);
    g = X'*X;
    D = sqrt(v + v' - 2 * g);
else  % case when there are two inputs (X,Z)
	%% fill in code here
    n = size(X,2);
    m = size(Z,2);
    v1 = X'*X;
    v2 = diag(v1);
    v = repmat(v2,1,m);
    r1 = Z'*Z;
    r2 = diag(r1);
    r3 = r2';
    r = repmat(r3,n,1);
    g = X'*Z;
    D = sqrt(v + r - 2 * g);
end;
%



