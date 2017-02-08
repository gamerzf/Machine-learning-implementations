function F=forest(X,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% X  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees
%
% OUTPUT:
% F | Forest
%

%% fill in code here
[~, n] = size(X);

if nargin < 3,
    nt = 10;
end
F = cell(nt, 1);

for ii = 1 : nt,
	index = randsample(n,n,true);
	T = id3tree(X(:, index), y(1, index));
    T=prunetree(T,X,y);
	F{ii} = T;
end

end
