function BDT=boosttree(X,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%
% Learns a boosted decision tree on data X with labels y.
% It performs at most nt boosting iterations. Each decision tree has maximum depth "maxdepth".
%
% INPUT:
% X  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees (default = 100)
% maxdepth | depth of each tree (default = 3)
%
% OUTPUT:
% BDT | Boosted DTree
%


%% fill in code here

if nargin<4,
    maxdepth = 3;
end;
if nargin<3,
    nt = 100;
end;

n = size(X, 2);
weights = ones(1, n)./ n;

BDT=cell(2,nt);

for i = 1:nt
    T = id3tree(X,y,maxdepth,weights);
    
    h = evaltree(T,X);
    err = sum(weights ((y ~= h)));
    if err>0.5
        break
    end
     alpha= 0.5.*log((1 -err) / err);
     
    weights = weights .* exp(- alpha .*h.*y )./(2*sqrt(err*(1-err)));
     weights = weights ./ sum(weights);
    
    BDT{1,i}=T;
    BDT{2,i}=alpha;
end
