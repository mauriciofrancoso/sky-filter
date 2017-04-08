function [mean_vector,devPad,minVal,aceptationArgHighPass,meanValue] = imgMeanHighPass( depthMovie,verbose )
% This function will receive depthmovie as a double(i,j,k) and will return
% a vector with the mean of the image, another with the standard
% theviation, the min value of mean and a variable aceptationArg used as
% threshold

[~,~,depth]=size(depthMovie);
mean_vector=zeros(1,depth);

%take the mean of each frame
for k=1:depth
    a=depthMovie(:,:,k);
    mean_vector(1,k)=mean(mean((a)));
end

%plot the mean if verbose
if verbose
    plot(1:depth,mean_vector);
end
%calculate the standard deviation, get the min value and define aceptation
%arg

meanValue=mean(mean_vector);
devPad=std(mean_vector);
minVal=min(mean_vector);
aceptationArgHighPass=minVal+(devPad/2);


end
