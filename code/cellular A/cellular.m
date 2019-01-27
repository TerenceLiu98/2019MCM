FF = im2uint8(rgb2gray(imread('/Volumes/Storage/2019_MCM-ICM_Problems/code/cellular A/Mask_FF.png' )));
SF = im2uint8(rgb2gray(imread('/Volumes/Storage/2019_MCM-ICM_Problems/code/cellular A/Mask_SF.png')));
GF = im2uint8(rgb2gray(imread('/Volumes/Storage/2019_MCM-ICM_Problems/code/cellular A/Mask_GF.png')));
LF = im2uint8(rgb2gray(imread('/Volumes/Storage/2019_MCM-ICM_Problems/code/cellular A/Mask_LF.png')));
% NF = rgb2gray(imread('/Volumes/Storage/2019_MCM-ICM_Problems/code/cellular A/Mask_NF.png')) ;
Structure_One = rgb2gray(imread('/Volumes/Storage/2019_MCM-ICM_Problems/code/cellular A/Structure_One.png'));
Structure_Two = rgb2gray(imread('/Volumes/Storage/2019_MCM-ICM_Problems/code/cellular A/Structure_Two.png'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Cell %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[X, Y] = size(Structure_One);
Louvre = zeros(X , Y, 4);% 3 Dimensional Model of Louvre Museum with
Mask_SF = im2uint8(zeros(X, Y)); % Second Floor's mask and human density
Mask_FF = im2uint8(zeros(X, Y)); % First Floor's mask and human density
Mask_GF = zeros(X, Y); % Ground Floor's mask and human density
Mask_LF = zeros(X, Y); % Lower Ground Floor's mask and human density
% Mask_NF = zeros(578,1168); % Napoleon Floor's mask

% Classify the basic structure of each floor %
Louvre(:,:,1) = Structure_Two; % Lower Ground Floor
Louvre(:,:,2) = Structure_Two; % Ground Floor 
Louvre(:,:,3) = Structure_One; % First Floor
Louvre(:,:,4) = Structure_One; % Second Floor
% Louvre(:,:,5) = Structure_One;
Louvre_back = Louvre;

Mask_SF(:, :) = Structure_One;
Mask_FF(:, :) = Structure_One;
Mask_GF(:, :) = Structure_Two;
Mask_LF(:, :) = Structure_Two;
% Mask_NF(2:579,2:1169) = Structure_Two;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% random rate %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x1=rand(1,3);y1=sum(x1);r1 = x1/y1; % random rate with sum is one
x2=rand(1,4);y2=sum(x2);r2 = x2/y2; % random quantity
group_rate = r1(1); % the proportion of tour group
individual_rate = r1(2); % the proportion of individual tourists
others_rate = r1(3);% the proportion of disable/elder

quantity_SF = fix(r2(1) * 3000); % quantity
quantity_FF = fix(r2(2) * 3000); % quantity
quantity_GF = fix(r2(3) * 3000); % quantity
quantity_LF = fix(r2(4) * 3000); % quantity
%q uantity_NF = 1000; % quantity

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% second floor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

evacute_gro = 0; % initial evacuate quantity of group
evacute_dis = 0; % initial evacuate quantity of disable/elderly
evacute_ind = 0; % initial evacuate quantity of individual
count1 = 0; count2 = 0; count3 = 0;% %initial data record
t0 = cputime; % initial time record
while 1
    for i = 1:X
        for j = 1:Y
            r = rand();
            if (r >= group_rate && Louvre(i,j,1)==0 && Mask_SF(i,j)==255)
                Louvre(i, j, 1) = 1;
                count1 = count1 + 1;
                count1
            end
                if (count1 >= fix(quantity_SF * group_rate))
                    evacute_gro = 1; 
                    break;
                end
        end
        if (evacute_gro == 1);
            break;
        end
    end
    for i = 1:X
        for j = 1:Y
            r = rand();
            if (r >= individual_rate && Louvre(i,j,1)==0 && Mask_SF(i,j)==255)
                Louvre(i, j, 1) = 2;
                count2 = count2 + 1;
                count2
            end
                if (count2 >= fix(quantity_SF * group_rate))
                    evacute_ind = 1;
                    break;
                end
        end
        if (evacute_gro == 1 && evacute_ind == 1);
            break;
        end
    end
    
    for i = 1:X
        for j = 1:Y
            r = rand();
            if (r >= others_rate && Louvre(i,j,1)==0 && Mask_SF(i,j)==255)
                Louvre(i, j, 1) = 3;
                count3 = count3 + 1;
                count3
            end
                if (count3 >= fix(quantity_SF * group_rate))
                    evacute_dis = 1; t1 = cputime;
                    break;
                end
        end
        if (evacute_gro == 1 && evacute_ind == 1 && evacute_dis ==1 );
            break; 
        end
    end
    if (evacute_gro == 1 && evacute_ind == 1 && evacute_dis ==1 );
            break;
    end
end
delta_t = t1 - t0
                
            

