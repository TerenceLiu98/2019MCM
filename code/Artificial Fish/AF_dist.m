function D=AF_dist(Xi,X)
%???i???????????????
%???
%Xi   ?i???????  
%X    ????????
% ???
%D    ?i?????????
col=size(X,2);
D=zeros(1,col);
for j=1:col
D(j)=norm(Xi-X(:,j));
end