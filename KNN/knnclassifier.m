function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%
%% fill in code here
 [indices, dists]=findknn(xTr,xTe,k);
%  indicesModeNotDefined=find(nrows~=1);
if size(indices,2)==1&size(indices,1)~=1
 [m,f,c]=mode(yTr(indices)',1);
else
 [m,f,c]=mode(yTr(indices),1);  
end
 [rows, cols] = cellfun(@size, c);
 
 if cols~=1
     while isempty(find(rows~=1, 1))&&k~=1
     k=k-1;
     subindex=find(rows~=1);
     subyTr=yTr(subindex);
     A=indices(subindex)
     subindices=A(1:k,:);
     [subM,f,c]=mode(subyTr(subindices),1);
     m(subindex)=subM;
     [rows, cols] = cellfun(@size, c);
     end
 else
     while rows~=1&k~=1
     k=k-1;
     subindices=indices(1:k,:);
    
     if k>1
        [m,f,c]=mode(yTr(subindices)',1);
     else
        [m,f,c]=mode(yTr(subindices),1);  
     end
     [rows, cols] = cellfun(@size, c);
     end
 end
 preds = m;
