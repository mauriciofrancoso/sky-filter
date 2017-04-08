function [ Parameters, BW,line] = FilterSky( I )
% This function will receive a image I as a double and will process to
% remove the sky


[row, col]=size(I); %take the size of image

[Dxx,Dxy,Dyy] = Hessian2D(I); %take the Hessian 2D transformation of the image

[Lambda1,~,~,~]=eig2image(Dxx,Dxy,Dyy); %use the hessian transformation to take the eigen vectors

Lambda1_Norm=mat2gray(Lambda1,[0 1]); %normalize the eigenvalue

level = graythresh(Lambda1_Norm); % computes a global threshold (LEVEL) that can be
% used to convert an intensity image to a binary image

BW = im2bw(Lambda1_Norm,level); %create a binary image based on the previous level value


%compute the standard deviation
s_0=rot90(BW);
std_row=std(s_0);
std_col=rot90(std_row,-1);



%compute the mean of each line of the BW image
Parameters=zeros(row,2);
Parameters(:,1)=mean(BW,2);
Parameters(:,2)=std_col;

%take the min mean of 3/4 of all lines
MIN=min(Parameters(1:ceil((3/4)*row),1));


%find which line is the min mean
for i=1:ceil((3/4)*row)
    if Parameters(i,1)==MIN
        line=i;
    end
end

%fills with zero until the min line

for i=1:line
    for j=1:col
        BW(i,j)=0;
    end
end


end
