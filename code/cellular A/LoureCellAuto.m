%%%%%%%%%%%%%%%%%%%%%%???????%%%%%%%%%%%%%%%%%%%%%%
d_nF1=rgb2gray(imread('-1??????.png'));
d_F0=rgb2gray(imread('0??????.png');
d_F1=rgb2gray(imread('1??????.png'));
d_F2=rgb2gray(imread('2??????.png'));
GroundMap=rgb2gray(imread('????0?.png'));
UpMap=rgb2gray(imread('12?????.png'));

%***********?????????*************%
Map=zeros(668,946,3);%??????????????????????
MapMasknF1=zeros(670,946);%??-1???????????????????
MapMaskF0=zeros(670,946);%??0???????????????????
MapMaskF1=zeros(670,946);%??1???????????????????
MapMaskF2=zeros(670,946);%??2???????????????????
Map(1:end,3:end,1)=GroundMap;%?????1?
Map(1:end,3:end,2)=GroundMap;%???0?
Map(:,:,3)=UpMap;%???1?
Map(:,:,4)=UpMap;%???2?
Map_p=Map;%?????????????
MapMasknF1(2:669,2:945)=GroundMap;%?????-1??
MapMaskF0(2:669,2:945)=GroundMap;%?????0
MapMaskF1(2:669,:)=UpMap;%?????1
MapMaskF2(2:669,:)=UpMap;%?????2

group_rate=0.3; %?????
individual_rate=0.7;%??????
nF1_num=10000;%?????
F0_num=12000;%?????
F1_num=10000;%?????
F2_num=17000;%?????
%---????????????????
for i=1:578
    for j=1:1168
        %for u=1:4
            if(Map_p(i,j)==255)
                Map_p(i,j)=0;
            else
                if(Map_p(i,j)==0)
                     Map_p(i,j)=255;
                end
            end
    end
end

%1????????2????????%

%%%%%%%%%
%??? %
%%%%%%%%%
flag1=0;%?????????
flag2=0;%????????
count1=0;count2=0;%????
while 1%-1?????????
    %????????????%
    for i=1:668
        for j=1:944
            r=rand();
            if(r>=0.7 && Map(i,j,1)==255 && d_nF1(i,j)==255)
                Map_p(i,j,1)=1;
                count1=count1+1;
            end
            if(count1==nF1_num*group_rate)
                flag1=1;
                break;
            end
        end
        if(flag1==1)
           break;
        end
    end
    %??????????????????????%
     for i=1:668
        for j=1:944
            r=rand();
            if(r>=0.7&&Map(i,j,1)==255&&d_nF1(i,j)==255)
                Map_p(i,j,1)=2;
                count2=count2+1;
            end
            if(count2==nF1_num*individual_rate)
                flag2=1;
                break;
            end
        end
        if(flag2==1)
           break;
        end
     end
    if(flag1==1&&flag2==1)
        break;
    end
end
temp1=Map_p(:,:,1);

%%%%%%%%%%%%%%%%%%%%
%     ???       %
%%%%%%%%%%%%%%%%%%%%
flag1=0;%?????????
flag2=0;%????????
count1=0;count2=0;%????
while 1%0?????????
    %????????????%
    for i=1:668
        for j=1:944
            r=rand();
            if(r>=0.7 && Map(i,j,2)==255 && d_F0(i,j)==255 )
                Map_p(i,j,2)=1;
                count1=count1+1;
            end
            if(count1==F0_num*group_rate)
                flag1=1;
                break;
            end
        end
        if(flag1==1)
           break;
        end
    end
    %??????????????????????%
     for i=1:668
        for j=1:944
            r=rand();
            if(r>=0.7&&Map(i,j,2)==255&&d_F0(i,j)==255)
                Map_p(i,j,2)=2;
                count2=count2+1;
            end
            if(count2==F0_num*individual_rate)
                flag2=1;
                break;
            end
        end
        if(flag2==1)
           break;
        end
     end
    if(flag1==1&&flag2==1)
        break;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            ???               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
flag1=0;%?????????
flag2=0;%????????
count1=0;count2=0;%????
while 1%1?????????
    %????????????%
    for i=1:668
        for j=1:944
            r=rand();
            if(r>=0.7 && Map(i,j,3)==255 && d_F1(i,j)==255 )
                Map_p(i,j,3)=1;
                count1=count1+1;
            end
            if(count1==F1_num*group_rate)
                flag1=1;
                break;
            end
        end
        if(flag1==1)
           break;
        end
    end
    %??????????????????????%
     for i=1:668
        for j=1:944
            r=rand();
            if(r>=0.7&&Map(i,j,3)==255&&d_F1(i,j)==255)
                Map_p(i,j,3)=2;
                count2=count2+1;
            end
            if(count2==F1_num*individual_rate)
                flag2=1;
                break;
            end
        end
        if(flag2==1)
           break;
        end
     end
    if(flag1==1&&flag2==1)
        break;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  ???                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
flag1=0;%?????????
flag2=0;%????????
count1=0;count2=0;%????
while 1%2?????????
    %????????????%
    for i=1:668
        for j=1:944
            r=rand();
            if(r>=0.7 && Map(i,j,4)==255 && d_F2(i,j)==255 )
                Map_p(i,j,4)=1;
                count1=count1+1;
            end
            if(count1==F2_num*group_rate)
                flag1=1;
                break;
            end
        end
        if(flag1==1)
           break;
        end
    end
    %??????????????????????%
     for i=1:668
        for j=1:944
            r=rand();
            if(r>=0.7&&Map(i,j,4)==255&&d_F2(i,j)==255)
                Map_p(i,j,4)=2;
                count2=count2+1;
            end
            if(count2==F2_num*individual_rate)
                flag2=1;
                break;
            end
        end
        if(flag2==1)
           break;
        end
     end
    if(flag1==1&&flag2==1)
        break;
    end
end
%%%%%%%%%%??????????????%%%%%%%%%%%%%%%%%%%%%

% %%%%%%%%%%%%%%%%%?????%%%%%%%%%%%%%%%%%%%%%
%   temp=Map_p(:,:,4);                          %
%   count1=0;count2=0;                          %
%   for i=1:668                                 %
%         for j=1:944                           %
%             if(temp(i,j)==1)                  %
%                 count1=count1+1;              %
%             end                               %
%             if(temp(i,j)==2)                  %
%                 count2=count2+1;              %
%             end                               %
%         end                                   %
%   end                                         %
%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%????????(?????)?%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      @note:           ???density???????????0
%                  ???????????????????????
%                      ?????????Map_p(i,j)==3???
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MapMasknF1(2:669,2:945)=Map_p(:,:,1);%?????-1
MapMaskF0(2:669,2:945)=Map_p(:,:,2);%?????0
MapMaskF1(2:669,2:945)=Map_p(:,:,3);%?????1
MapMaskF2(2:669,2:945)=Map_p(:,:,4);%?????2
densitynF1=zeros(668,944);%???????
densityF0=zeros(668,944);%???????
densityF1=zeros(668,944);%???????
densityF2=zeros(668,944);%???????

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%?????%
for i=2:669
    for j=2:945
        if(MapMasknF1(i,j)==255)
            MapMasknF1(i,j)=0;
        end%???
        if(MapMasknF1(i,j)==2)
            MapMasknF1(i,j)=1;
        end%?????
    end
end
densitynF1(1:668,1:944)=MapMasknF1(1:668,1:944)+MapMasknF1(1:668,2:945)+MapMasknF1(1:668,3:946)+...
     MapMasknF1(2:669,1:944)+MapMasknF1(2:669,3:946)++MapMasknF1(3:670,1:944)+...
  MapMasknF1(3:670,2:945)+MapMasknF1(3:670,3:946);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %?????%
for i=2:669
    for j=2:945
        if(MapMaskF0(i,j)==255)
            MapMaskF0(i,j)=0;
        end%???
        if(MapMaskF0(i,j)==2)
            MapMaskF0(i,j)=1;
        end%?????
    end
end
densityF0(1:668,1:944)=MapMaskF0(1:668,1:944)+MapMaskF0(1:668,2:945)+MapMaskF0(1:668,3:946)+...
     MapMaskF0(2:669,1:944)+MapMaskF0(2:669,3:946)++MapMaskF0(3:670,1:944)+...
  MapMaskF0(3:670,2:945)+MapMaskF0(3:670,3:946);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %?????%
for i=2:669
    for j=2:945
        if(MapMaskF1(i,j)==255)
            MapMaskF1(i,j)=0;
        end%???
        if(MapMaskF1(i,j)==2)
            MapMaskF1(i,j)=1;
        end%?????
    end
end
densityF1(1:668,1:944)=MapMaskF1(1:668,1:944)+MapMaskF1(1:668,2:945)+MapMaskF1(1:668,3:946)+...
     MapMaskF1(2:669,1:944)+MapMaskF1(2:669,3:946)++MapMaskF1(3:670,1:944)+...
  MapMaskF1(3:670,2:945)+MapMaskF1(3:670,3:946);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%?????
for i=2:669
    for j=2:945
        if(MapMaskF2(i,j)==255)
            MapMaskF2(i,j)=0;
        end%???
        if(MapMaskF2(i,j)==2)
            MapMaskF2(i,j)=1;
        end%?????
    end
end
densityF2(1:668,1:944)=MapMaskF2(1:668,1:944)+MapMaskF2(1:668,2:945)+MapMaskF2(1:668,3:946)+...
     MapMaskF2(2:669,1:944)+MapMaskF2(2:669,3:946)++MapMaskF2(3:670,1:944)+...
  MapMaskF2(3:670,2:945)+MapMaskF2(3:670,3:946);

%??????????????
MapMasknF1(2:669,2:945)=Map_p(:,:,1);%?????-1
MapMaskF0(2:669,2:945)=Map_p(:,:,2);%?????0
MapMaskF1(2:669,2:945)=Map_p(:,:,3);%?????1
MapMaskF2(2:669,2:945)=Map_p(:,:,4);%?????2
%------------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%???????%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                      %%%%%?100??????????%%%%%
%----------------??????------------------%
m1=3;m2=4;m3=6;m4=4;%???????             %
width=2;%2n+1=????                          %
ExitList1=zeros(2,m1);%-1??????           %
ExitList2=zeros(2,m2);%0??????            %
ExitList3=zeros(2,m3);%1??????            %
ExitList4=zeros(2,m4);%2??????            %
%----------------------------------------------%

%-????????
%-----(??????????30?????----------%
ExitList1(1,1)=312;ExitList1(2,1)=571; %??%
%--------------------------------------%
ExitList1(1,2)=261;ExitList1(2,2)=463;%??
ExitList1(1,3)=385;ExitList1(2,3)=488;%??
%-????????
ExitList2(1,1)=180;ExitList2(2,1)=342;%???????
ExitList2(1,2)=161;ExitList2(2,2)=496;%????????
ExitList2(1,3)=440;ExitList2(2,3)=226;%??????
ExitList2(1,4)=493;ExitList2(2,4)=228;%??????
%-????????
ExitList3(1,1)=440;ExitList3(2,1)=217;%??
ExitList3(1,2)=487;ExitList3(2,2)=495;%??
ExitList3(1,3)=159;ExitList3(2,3)=495;%??
ExitList3(1,4)=228;ExitList3(2,4)=846;%??
ExitList3(1,5)=430;ExitList3(2,5)=846;%??
%--------(????????30?????----------%
ExitList3(1,6)=293;ExitList3(2,6)=689;%??
%-????????
ExitList4(1,1)=159;ExitList4(2,1)=495;%??
ExitList4(1,2)=228;ExitList4(2,2)=846;%??
ExitList4(1,3)=430;ExitList4(2,3)=846;%??
%--------(????????30?????----------%
ExitList4(1,4)=293;ExitList4(2,4)=689;%??
%%%%%%%%%%%%%%%%%%???????%%%%%%%%%%%%%%%%%%%%%%
          %%%%%?3???????????%%%%%
k1=3;k2=7;k3=9;k4=5;
%---------------------------------------------%
GuideList1=zeros(2,k1);%-1???????       %
GuideList2=zeros(2,k2);%0???????        %
GuideList3=zeros(2,k3);%1???????        %
GuideList4=zeros(2,k4);%2???????        %
%---------------?????---------------------%
%----@note??????????????m??-----%
GuideList1_EXIT=[1 2 3];
GuideList2_EXIT=[4 4 3 1 2 2 2];
GuideList3_EXIT=[1 2 2 3 3 6 6 5 4];
GuideList4_EXIT=[1 4 4 3 2];
%---------------------------------------------%
%-????????
GuideList1(1,1)=330;GuideList1(2,1)=670;      %
GuideList1(1,2)=210;GuideList1(2,2)=493;      %
GuideList1(1,3)=470;GuideList1(2,3)=502;      %
%-????????
GuideList2(1,1)=478;GuideList2(2,1)=353;      %
GuideList2(1,2)=442;GuideList2(2,2)=502;      %
GuideList2(1,3)=393;GuideList2(2,3)=618;      %
GuideList2(1,4)=210;GuideList2(2,4)=440;      %
GuideList2(1,5)=260;GuideList2(2,5)=660;      %
GuideList2(1,6)=405;GuideList2(2,6)=780;      %
GuideList2(1,7)=250;GuideList2(2,7)=850;      %
%-????????
GuideList3(1,1)=475;GuideList3(2,1)=330;      %
GuideList3(1,2)=440;GuideList3(2,2)=490;      %
GuideList3(1,3)=445;GuideList3(2,3)=610;      %
GuideList3(1,4)=160;GuideList3(2,4)=355;      %
GuideList3(1,5)=215;GuideList3(2,5)=500;      %
GuideList3(1,6)=230;GuideList3(2,6)=630;      %
GuideList3(1,7)=245;GuideList3(2,7)=725;      %
GuideList3(1,8)=410;GuideList3(2,8)=730;      %
GuideList3(1,9)=310;GuideList3(2,9)=845;      %
%-????????                             %
GuideList4(1,1)=172;GuideList4(2,1)=431;      %
GuideList4(1,2)=225;GuideList4(2,2)=618;      %
GuideList4(1,3)=250;GuideList4(2,3)=765;      %
GuideList4(1,4)=405;GuideList4(2,4)=765;      %
GuideList4(1,5)=310;GuideList4(2,5)=845;      %
%---------------------------------------------%
for k=1:k1                              
    p1=GuideList1(1,k);p2=GuideList1(2,k);                            
    Map_p(p1,p2,1)=3;   %
end                                               %
for k=1:k2                                        
    p1=GuideList2(1,k);p2=GuideList2(2,k); 
    Map_p(p1,p2,2)=3;   %
end                                               %
for k=1:k3            
    p1=GuideList3(1,k);p2=GuideList3(2,k);        %
    Map_p(p1,p2,3)=3;   %
end                                               %
for k=1:k4               
    p1=GuideList4(1,k);p2=GuideList4(2,k); %
    Map_p(p1,p2,4)=3;   %
end                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%??????????????????%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%??????????
%???????Map_p,???????
Map_pnF1=Map_p(:,:,1);
Map_pF0=Map_p(:,:,2);
Map_pF1=Map_p(:,:,3);
Map_pF2=Map_p(:,:,4);
%------?????????--------
figure()
Si=imshow(Map_pnF1);
ti=0;
tp=title(['T = ',num2str(ti)]);
%------?????????--------
figure()
Si1=imshow(Map_pF0);
ti1=0;
tp1=title(['T = ',num2str(ti1)]);
%------?????????--------
figure()
Si2=imshow(Map_pF1);
ti2=0;
tp2=title(['T = ',num2str(ti2)]);
%------?????????--------
figure()
Si3=imshow(Map_pF2);
ti3=0;
tp3=title(['T = ',num2str(ti3)]);

%--------?????????---------
c1=0.001;%????
c2=7;%???????
c3=10;%??????
c4=0.01;%???????
rp_t=5000;%????????
re_t=50;%????????
%%%------------------------------------?-1??????????????------------------------------------%%%
for m=1:100
   %????+1
    ti=ti+1;
    %??????
    Map_pnF1=Map_p(:,:,1);
    Map_pF0=Map_p(:,:,2);
    Map_pF1=Map_p(:,:,3);
    Map_pF2=Map_p(:,:,4);
   %????????????????????????????
    M_field=c4*rand(668,944);
    MapMasknF1(2:669,2:945)=Map_p(:,:,1);%??????
    for i=2:669
        for j=2:945
            if(MapMasknF1(i,j)==255||MapMasknF1(i,j)==100)
                MapMasknF1(i,j)=0;
            end%??????
            if(MapMasknF1(i,j)==2||MapMasknF1(i,j)==3)
                MapMasknF1(i,j)=1;
            end%???????????
        end
    end
    %%%-----------------????????----------------------
    %%--------------------?????-----------------------------
    % @note????????????c1????????
    %-----------------------------------------------------------
    densitynF1(1:668,1:944)=MapMasknF1(1:668,1:944)+MapMasknF1(1:668,2:945)+MapMasknF1(1:668,3:946)+...
         MapMasknF1(2:669,1:944)+MapMasknF1(2:669,3:946)++MapMasknF1(3:670,1:944)+...
         MapMasknF1(3:670,2:945)+MapMasknF1(3:670,3:946);
     %-----------????????------------
     for i=2:667
         for j=2:943
             M_field(i,j)=M_field(i,j)+...
             c1*(densitynF1(i-1,j-1)+densitynF1(i-1,j)+densitynF1(i-1,j+1)+...
             densitynF1(i,j+1)+densitynF1(i,j+1)+densitynF1(i+1,j+1)+...
             densitynF1(i+1,j-1)+densitynF1(i,j-1));
         end
     end
     MapMasknF1=zeros(670,946);%???????????
    %%--------------------?????-----------------------------
    % @note?????????????????????????
    %         ??????rp_t??eta??1?????0
    %-----------------------------------------------------------
    MapMasknF1(2:669,2:945)=Map_p(:,:,1);%??????
    for i=2:669
        for j=2:945
            if(MapMasknF1(i,j)==255||MapMasknF1(i,j)==100||MapMasknF1(i,j)==3)
                MapMasknF1(i,j)=0;
            end%??????????
            if(MapMasknF1(i,j)==2||MapMasknF1(i,j)==1)
                MapMasknF1(i,j)=1;
            end%??????????
        end
    end%????????????
    for i=1:668
        for j=1:944
            if(MapMasknF1(i+1,j+1)==1)%??????????
                min_l=2000;k_t=0;eta=0;
                for k=1:k1%????????
                    if((abs(GuideList1(1,k)-i)+abs(GuideList1(2,k)-j))<min_l)
                        min_l=abs(GuideList1(1,k)-i)+abs(GuideList1(2,k)-j);
                        k_t=k;
                    end
                end
                if(min_l<=rp_t)%?????????
                    eta=1;
                end
                %--------------??????????----------------
                min_ex1=ExitList1(1,GuideList1_EXIT(k_t));%???????1
                min_ex2=ExitList1(2,GuideList1_EXIT(k_t));%???????2
                %------------????Moore???????-----------------
                Moore=zeros(8,1);
                Moore(1,1)=(abs(min_ex1-i+1)+abs(min_ex2-j+1));
                Moore(2,1)= (abs(min_ex1-i+1)+abs(min_ex2-j));
                Moore(3,1)=(abs(min_ex1-i+1)+abs(min_ex2-j-1));
                Moore(4,1)=(abs(min_ex1-i)+abs(min_ex2-j-1));
                Moore(5,1)=(abs(min_ex1-i-1)+abs(min_ex2-j-1));
                Moore(6,1)=(abs(min_ex1-i-1)+abs(min_ex2-j));
                Moore(7,1)=(abs(min_ex1-i-1)+abs(min_ex2-j+1));
                Moore(8,1)=(abs(min_ex1-i)+abs(min_ex2-j+1));
               [value,index]=min(Moore);
               switch index
                   case 1
                       M_field(i-1,j-1)=M_field(i-1,j-1)+c2*eta;
                   case 2
                       M_field(i-1,j)=M_field(i-1,j)+c2*eta;
                   case 3
                       M_field(i-1,j+1)=M_field(i-1,j+1)+c2*eta;
                   case 4
                       M_field(i,j+1)=M_field(i,j+1)+c2*eta;
                   case 5
                       M_field(i+1,j+1)=M_field(i+1,j+1)+c2*eta;
                   case 6
                       M_field(i+1,j)=M_field(i+1,j)+c2*eta;
                   case 7
                       M_field(i+1,j-1)=M_field(i+1,j-1)+c2*eta;
                   case 8
                       M_field(i,j-1)=M_field(i,j-1)+c2*eta;
               end
            end
        end
    end
    MapMasknF1=zeros(670,946);%???????????
    
     %%--------------------?????-----------------------------
    % @note????????????????????????
    %   ??????re_t?????????eta1??1?????0
    %-----------------------------------------------------------
    MapMasknF1(2:669,2:945)=Map_p(:,:,1);%??????
    for i=2:669
        for j=2:945
            if(MapMasknF1(i,j)==255||MapMasknF1(i,j)==100||MapMasknF1(i,j)==3)
                MapMasknF1(i,j)=0;
            end%??????????
            if(MapMasknF1(i,j)==2)
                MapMasknF1(i,j)=1;
            end%??????????
        end
    end%????????????
    for i=1:668
        for j=1:944
            if(MapMasknF1(i+1,j+1)==1)%??????????
                min_l=2000;k_t=0;eta1=0;
                for k=1:m1%???????
                    if((abs(ExitList1(1,k)-i)+abs(ExitList1(2,k)-j))<min_l)
                        min_l=abs(ExitList1(1,k)-i)+abs(ExitList1(2,k)-j);
                        k_t=k;%????
                    end
                end
                %------------?????????-------------------------
                min_ex1=ExitList1(1,k_t);%??????1
                min_ex2=ExitList1(2,k_t);%??????2
                %------------????Moore???????-----------------
                Moore=zeros(8,1);
                Moore(1,1)=(abs(min_ex1-i+1)+abs(min_ex2-j+1));
                Moore(2,1)= (abs(min_ex1-i+1)+abs(min_ex2-j));
                Moore(3,1)=(abs(min_ex1-i+1)+abs(min_ex2-j-1));
                Moore(4,1)=(abs(min_ex1-i)+abs(min_ex2-j-1));
                Moore(5,1)=(abs(min_ex1-i-1)+abs(min_ex2-j-1));
                Moore(6,1)=(abs(min_ex1-i-1)+abs(min_ex2-j));
                Moore(7,1)=(abs(min_ex1-i-1)+abs(min_ex2-j+1));
                Moore(8,1)=(abs(min_ex1-i)+abs(min_ex2-j+1));
               [value,index]=min(Moore);
               switch index
                   case 1
                       M_field(i-1,j-1)=M_field(i-1,j-1)+c3*(1/value);
                   case 2
                       M_field(i-1,j)=M_field(i-1,j)+c3*(1/value);
                   case 3
                       M_field(i-1,j+1)=M_field(i-1,j+1)+c3*(1/value);
                   case 4
                       M_field(i,j+1)=M_field(i,j+1)+c3*(1/value);
                   case 5
                       M_field(i+1,j+1)=M_field(i+1,j+1)+c3*(1/value);
                   case 6
                       M_field(i+1,j)=M_field(i+1,j)+c3*(1/value);
                   case 7
                       M_field(i+1,j-1)=M_field(i+1,j-1)+c3*(1/value);
                   case 8
                       M_field(i,j-1)=M_field(i,j-1)+c3*(1/value);
               end
            end
        end
    end
    MapMasknF1=zeros(670,946);%???????????
    %%--------------------??????-----------------------------
    % @note????????????????????
    %-------------------------------------------------------------
     MapMasknF1(2:669,2:945)=Map_p(:,:,1);%??????????
     for i=2:669
        for j=2:945
            if(MapMasknF1(i,j)==255||MapMasknF1(i,j)==100||MapMasknF1(i,j)==3)
                MapMasknF1(i,j)=0;
            end%??????????
            if(MapMasknF1(i,j)==2||MapMasknF1(i,j)==1)
                MapMasknF1(i,j)=1;
            end%??????????
        end
    end%????????????
     for i=1:668
         for j=1:944
             if(MapMasknF1(i+1,j+1)==1)%???????
                 w_temp=zeros(8,1);
                 %--------????--------
                 if(Map_p(i-1,j-1,1)==255||Map_p(i-1,j-1,1)==1||Map_p(i-1,j-1,1)==2||Map_p(i-1,j-1,1)==3)%???????
                     w_temp(1,1)=-20000;%????????????0???
                 else
                 w_temp(1,1)=M_field(i-1,j-1);
                 end
                 %--------????--------
                 if(Map_p(i-1,j,1)==255||Map_p(i-1,j,1)==1||Map_p(i-1,j,1)==2||Map_p(i-1,j,1)==3)%???????
                     w_temp(2,1)=-20000;
                 else
                     w_temp(2,1)=M_field(i-1,j);
                 end
                 %--------????--------
                 if(Map_p(i-1,j+1,1)==255||Map_p(i-1,j+1,1)==1||Map_p(i-1,j+1,1)==2||Map_p(i-1,j+1,1)==3)%???????
                     w_temp(3,1)=-20000;
                 else
                     w_temp(3,1)=M_field(i-1,j+1);
                 end
                 %--------????--------
                 if(Map_p(i,j+1,1)==255||Map_p(i,j+1,1)==1||Map_p(i,j+1,1)==2||Map_p(i,j+1,1)==3)%???????
                     w_temp(4,1)=-20000;
                 else
                     w_temp(4,1)=M_field(i,j+1);
                 end
                 %--------????--------
                 if(Map_p(i+1,j+1,1)==255||Map_p(i+1,j+1,1)==1||Map_p(i+1,j+1,1)==2||Map_p(i+1,j+1,1)==3)%???????
                     w_temp(5,1)=-20000;
                 else
                     w_temp(5,1)=M_field(i+1,j+1);
                 end
                 %--------????--------
                 if(Map_p(i+1,j,1)==255||Map_p(i+1,j,1)==1||Map_p(i+1,j,1)==2||Map_p(i+1,j,1)==3)%???????
                     w_temp(6,1)=-20000;
                 else
                     w_temp(6,1)=M_field(i+1,j);
                 end
                 %--------????--------
                 if(Map_p(i+1,j-1,1)==255||Map_p(i+1,j-1,1)==1||Map_p(i+1,j-1,1)==2||Map_p(i+1,j-1,1)==3)%???????
                     w_temp(7,1)=-20000;
                 else
                     w_temp(7,1)=M_field(i+1,j-1);
                 end
                 %--------????--------
                 if(Map_p(i,j-1,1)==255||Map_p(i,j-1,1)==1||Map_p(i,j-1,1)==2||Map_p(i,j-1,1)==3)%???????
                     w_temp(8,1)=-20000;
                 else
                     w_temp(8,1)=M_field(i,j-1);
                 end
                 [value1,index1]=max(w_temp);
                 u=sum(w_temp);
                 if(u>=-100000)%????????????
                     switch index1
                     case 1
                         Map_p(i-1,j-1,1)=Map_p(i,j,1);%?????????????
                     case 2
                         Map_p(i-1,j,1)=Map_p(i,j,1);
                     case 3
                         Map_p(i-1,j+1,1)=Map_p(i-1,j,1);
                     case 4
                         Map_p(i,j+1,1)=Map_p(i,j,1);
                     case 5
                         Map_p(i+1,j+1,1)=Map_p(i,j,1);
                     case 6
                         Map_p(i+1,j,1)=Map_p(i,j,1);
                     case 7
                         Map_p(i+1,j-1,1)=Map_p(i,j,1);
                     case 8
                         Map_p(i,j-1,1)=Map_p(i,j,1);
                     end
                     Map_p(i,j,1)=0;%?????
                 end
             end
         end
     end
     set(Si,'CData',Map_pnF1);
     set(tp,'string',['T = ',num2str(ti)])
     pause(1);
end

%%%------------------------------------??0??????????????------------------------------------%%%
for m=1:100
   %????+1
    ti=ti+1;
    %??????
    Map_pnF1=Map_p(:,:,1);
    Map_pF0=Map_p(:,:,2);
    Map_pF1=Map_p(:,:,3);
    Map_pF2=Map_p(:,:,4);
   %????????????????????????????
    M_field=c4*rand(668,944);
    MapMasknF1(2:669,2:945)=Map_p(:,:,1);%??????
    for i=2:669
        for j=2:945
            if(MapMasknF1(i,j)==255||MapMasknF1(i,j)==100)
                MapMasknF1(i,j)=0;
            end%??????
            if(MapMasknF1(i,j)==2||MapMasknF1(i,j)==3)
                MapMasknF1(i,j)=1;
            end%???????????
        end
    end
    %%%-----------------????????----------------------
    %%--------------------?????-----------------------------
    % @note????????????c1????????
    %-----------------------------------------------------------
    densitynF1(1:668,1:944)=MapMasknF1(1:668,1:944)+MapMasknF1(1:668,2:945)+MapMasknF1(1:668,3:946)+...
         MapMasknF1(2:669,1:944)+MapMasknF1(2:669,3:946)++MapMasknF1(3:670,1:944)+...
         MapMasknF1(3:670,2:945)+MapMasknF1(3:670,3:946);
     %-----------????????------------
     for i=2:667
         for j=2:943
             M_field(i,j)=M_field(i,j)+...
             c1*(densitynF1(i-1,j-1)+densitynF1(i-1,j)+densitynF1(i-1,j+1)+...
             densitynF1(i,j+1)+densitynF1(i,j+1)+densitynF1(i+1,j+1)+...
             densitynF1(i+1,j-1)+densitynF1(i,j-1));
         end
     end
     MapMasknF1=zeros(670,946);%???????????
    %%--------------------?????-----------------------------
    % @note?????????????????????????
    %         ??????rp_t??eta??1?????0
    %-----------------------------------------------------------
    MapMasknF1(2:669,2:945)=Map_p(:,:,1);%??????
    for i=2:669
        for j=2:945
            if(MapMasknF1(i,j)==255||MapMasknF1(i,j)==100||MapMasknF1(i,j)==3)
                MapMasknF1(i,j)=0;
            end%??????????
            if(MapMasknF1(i,j)==2||MapMasknF1(i,j)==1)
                MapMasknF1(i,j)=1;
            end%??????????
        end
    end%????????????
    for i=1:668
        for j=1:944
            if(MapMasknF1(i+1,j+1)==1)%??????????
                min_l=2000;k_t=0;eta=0;
                for k=1:k1%????????
                    if((abs(GuideList1(1,k)-i)+abs(GuideList1(2,k)-j))<min_l)
                        min_l=abs(GuideList1(1,k)-i)+abs(GuideList1(2,k)-j);
                        k_t=k;
                    end
                end
                if(min_l<=rp_t)%?????????
                    eta=1;
                end
                %--------------??????????----------------
                min_ex1=ExitList1(1,GuideList1_EXIT(k_t));%???????1
                min_ex2=ExitList1(2,GuideList1_EXIT(k_t));%???????2
                %------------????Moore???????-----------------
                Moore=zeros(8,1);
                Moore(1,1)=(abs(min_ex1-i+1)+abs(min_ex2-j+1));
                Moore(2,1)= (abs(min_ex1-i+1)+abs(min_ex2-j));
                Moore(3,1)=(abs(min_ex1-i+1)+abs(min_ex2-j-1));
                Moore(4,1)=(abs(min_ex1-i)+abs(min_ex2-j-1));
                Moore(5,1)=(abs(min_ex1-i-1)+abs(min_ex2-j-1));
                Moore(6,1)=(abs(min_ex1-i-1)+abs(min_ex2-j));
                Moore(7,1)=(abs(min_ex1-i-1)+abs(min_ex2-j+1));
                Moore(8,1)=(abs(min_ex1-i)+abs(min_ex2-j+1));
               [value,index]=min(Moore);
               switch index
                   case 1
                       M_field(i-1,j-1)=M_field(i-1,j-1)+c2*eta;
                   case 2
                       M_field(i-1,j)=M_field(i-1,j)+c2*eta;
                   case 3
                       M_field(i-1,j+1)=M_field(i-1,j+1)+c2*eta;
                   case 4
                       M_field(i,j+1)=M_field(i,j+1)+c2*eta;
                   case 5
                       M_field(i+1,j+1)=M_field(i+1,j+1)+c2*eta;
                   case 6
                       M_field(i+1,j)=M_field(i+1,j)+c2*eta;
                   case 7
                       M_field(i+1,j-1)=M_field(i+1,j-1)+c2*eta;
                   case 8
                       M_field(i,j-1)=M_field(i,j-1)+c2*eta;
               end
            end
        end
    end
    MapMasknF1=zeros(670,946);%???????????
    
     %%--------------------?????-----------------------------
    % @note????????????????????????
    %   ??????re_t?????????eta1??1?????0
    %-----------------------------------------------------------
    MapMasknF1(2:669,2:945)=Map_p(:,:,1);%??????
    for i=2:669
        for j=2:945
            if(MapMasknF1(i,j)==255||MapMasknF1(i,j)==100||MapMasknF1(i,j)==3)
                MapMasknF1(i,j)=0;
            end%??????????
            if(MapMasknF1(i,j)==2)
                MapMasknF1(i,j)=1;
            end%??????????
        end
    end%????????????
    for i=1:668
        for j=1:944
            if(MapMasknF1(i+1,j+1)==1)%??????????
                min_l=2000;k_t=0;eta1=0;
                for k=1:m1%???????
                    if((abs(ExitList1(1,k)-i)+abs(ExitList1(2,k)-j))<min_l)
                        min_l=abs(ExitList1(1,k)-i)+abs(ExitList1(2,k)-j);
                        k_t=k;%????
                    end
                end
                %------------?????????-------------------------
                min_ex1=ExitList1(1,k_t);%??????1
                min_ex2=ExitList1(2,k_t);%??????2
                %------------????Moore???????-----------------
                Moore=zeros(8,1);
                Moore(1,1)=(abs(min_ex1-i+1)+abs(min_ex2-j+1));
                Moore(2,1)= (abs(min_ex1-i+1)+abs(min_ex2-j));
                Moore(3,1)=(abs(min_ex1-i+1)+abs(min_ex2-j-1));
                Moore(4,1)=(abs(min_ex1-i)+abs(min_ex2-j-1));
                Moore(5,1)=(abs(min_ex1-i-1)+abs(min_ex2-j-1));
                Moore(6,1)=(abs(min_ex1-i-1)+abs(min_ex2-j));
                Moore(7,1)=(abs(min_ex1-i-1)+abs(min_ex2-j+1));
                Moore(8,1)=(abs(min_ex1-i)+abs(min_ex2-j+1));
               [value,index]=min(Moore);
               switch index
                   case 1
                       M_field(i-1,j-1)=M_field(i-1,j-1)+c3*(1/value);
                   case 2
                       M_field(i-1,j)=M_field(i-1,j)+c3*(1/value);
                   case 3
                       M_field(i-1,j+1)=M_field(i-1,j+1)+c3*(1/value);
                   case 4
                       M_field(i,j+1)=M_field(i,j+1)+c3*(1/value);
                   case 5
                       M_field(i+1,j+1)=M_field(i+1,j+1)+c3*(1/value);
                   case 6
                       M_field(i+1,j)=M_field(i+1,j)+c3*(1/value);
                   case 7
                       M_field(i+1,j-1)=M_field(i+1,j-1)+c3*(1/value);
                   case 8
                       M_field(i,j-1)=M_field(i,j-1)+c3*(1/value);
               end
            end
        end
    end
    MapMasknF1=zeros(670,946);%???????????
    %%--------------------??????-----------------------------
    % @note????????????????????
    %-------------------------------------------------------------
     MapMasknF1(2:669,2:945)=Map_p(:,:,1);%??????????
     for i=2:669
        for j=2:945
            if(MapMasknF1(i,j)==255||MapMasknF1(i,j)==100||MapMasknF1(i,j)==3)
                MapMasknF1(i,j)=0;
            end%??????????
            if(MapMasknF1(i,j)==2||MapMasknF1(i,j)==1)
                MapMasknF1(i,j)=1;
            end%??????????
        end
    end%????????????
     for i=1:668
         for j=1:944
             if(MapMasknF1(i+1,j+1)==1)%???????
                 w_temp=zeros(8,1);
                 %--------????--------
                 if(Map_p(i-1,j-1,1)==255||Map_p(i-1,j-1,1)==1||Map_p(i-1,j-1,1)==2||Map_p(i-1,j-1,1)==3)%???????
                     w_temp(1,1)=-20000;%????????????0???
                 else
                 w_temp(1,1)=M_field(i-1,j-1);
                 end
                 %--------????--------
                 if(Map_p(i-1,j,1)==255||Map_p(i-1,j,1)==1||Map_p(i-1,j,1)==2||Map_p(i-1,j,1)==3)%???????
                     w_temp(2,1)=-20000;
                 else
                     w_temp(2,1)=M_field(i-1,j);
                 end
                 %--------????--------
                 if(Map_p(i-1,j+1,1)==255||Map_p(i-1,j+1,1)==1||Map_p(i-1,j+1,1)==2||Map_p(i-1,j+1,1)==3)%???????
                     w_temp(3,1)=-20000;
                 else
                     w_temp(3,1)=M_field(i-1,j+1);
                 end
                 %--------????--------
                 if(Map_p(i,j+1,1)==255||Map_p(i,j+1,1)==1||Map_p(i,j+1,1)==2||Map_p(i,j+1,1)==3)%???????
                     w_temp(4,1)=-20000;
                 else
                     w_temp(4,1)=M_field(i,j+1);
                 end
                 %--------????--------
                 if(Map_p(i+1,j+1,1)==255||Map_p(i+1,j+1,1)==1||Map_p(i+1,j+1,1)==2||Map_p(i+1,j+1,1)==3)%???????
                     w_temp(5,1)=-20000;
                 else
                     w_temp(5,1)=M_field(i+1,j+1);
                 end
                 %--------????--------
                 if(Map_p(i+1,j,1)==255||Map_p(i+1,j,1)==1||Map_p(i+1,j,1)==2||Map_p(i+1,j,1)==3)%???????
                     w_temp(6,1)=-20000;
                 else
                     w_temp(6,1)=M_field(i+1,j);
                 end
                 %--------????--------
                 if(Map_p(i+1,j-1,1)==255||Map_p(i+1,j-1,1)==1||Map_p(i+1,j-1,1)==2||Map_p(i+1,j-1,1)==3)%???????
                     w_temp(7,1)=-20000;
                 else
                     w_temp(7,1)=M_field(i+1,j-1);
                 end
                 %--------????--------
                 if(Map_p(i,j-1,1)==255||Map_p(i,j-1,1)==1||Map_p(i,j-1,1)==2||Map_p(i,j-1,1)==3)%???????
                     w_temp(8,1)=-20000;
                 else
                     w_temp(8,1)=M_field(i,j-1);
                 end
                 [value1,index1]=max(w_temp);
                 u=sum(w_temp);
                 if(u>=-100000)%????????????
                     switch index1
                     case 1
                         Map_p(i-1,j-1,1)=Map_p(i,j,1);%?????????????
                     case 2
                         Map_p(i-1,j,1)=Map_p(i,j,1);
                     case 3
                         Map_p(i-1,j+1,1)=Map_p(i-1,j,1);
                     case 4
                         Map_p(i,j+1,1)=Map_p(i,j,1);
                     case 5
                         Map_p(i+1,j+1,1)=Map_p(i,j,1);
                     case 6
                         Map_p(i+1,j,1)=Map_p(i,j,1);
                     case 7
                         Map_p(i+1,j-1,1)=Map_p(i,j,1);
                     case 8
                         Map_p(i,j-1,1)=Map_p(i,j,1);
                     end
                     Map_p(i,j,1)=0;%?????
                 end
             end
         end
     end
     set(Si,'CData',Map_pnF1);
     set(tp,'string',['T = ',num2str(ti)])
     pause(1);
end
