function [Xnext,Ynext]=AF_prey(Xi,ii,visual,step,try_number,LBUB,lastY)
%????
%???
%Xi          ????????
%ii          ????????
%visual      ????
%step        ??????
%try_number  ??????
%LBUB        ???????
%lastY       ??????????????
%???
%Xnext       Xi?????????  
%Ynext       Xi??????????????
Xnext=[];
Yi=lastY(ii);
for i=1:try_number
Xj=Xi+(2*rand(length(Xi),1)-1)*visual;
Yj=AF_foodconsistence(Xj);
if Yi<Yj
Xnext=Xi+rand*step*(Xj-Xi)/norm(Xj-Xi);
for i=1:length(Xnext)
if  Xnext(i)>LBUB(i,2)
Xnext(i)=LBUB(i,2);
end
if  Xnext(i)<LBUB(i,1)
Xnext(i)=LBUB(i,1);
end
end
Xi=Xnext;
break;
end
end
%????
if isempty(Xnext)
Xj=Xi+(2*rand(length(Xi),1)-1)*visual;
Xnext=Xj;
for i=1:length(Xnext)
if  Xnext(i)>LBUB(i,2)
Xnext(i)=LBUB(i,2);
end
if  Xnext(i)<LBUB(i,1)
Xnext(i)=LBUB(i,1);
end
end
end
Ynext=AF_foodconsistence(Xnext);