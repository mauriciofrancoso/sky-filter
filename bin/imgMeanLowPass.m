function [mean_vector,devPad,aceptationArgLowPass,meanValue] = imgMeanLowPass( depthMovie,verbose )
% This function will receive depthmovie as a double(i,j,k) and will return
% a vector with the mean of the image, another with the standard
% theviation, the min value of mean and a variable aceptationArg used as
% threshold

[row,~,depth]=size(depthMovie);
mean_vector=zeros(1,depth);

newRow=round((row/5)*3);

%take the mean of each frame
for k=1:depth
    a=depthMovie(1:newRow,:,k);
    mean_vector(1,k)=mean(mean((a)));
end

%calculate the standard deviation, get the min value and define aceptation
%arg

meanValue=mean(mean_vector);
devPad=std(mean_vector);
aceptationArgLowPass=meanValue+(devPad/4);

%plot the mean if verbose
if verbose
    plot(1:depth,mean_vector,1:depth,(meanValue+(devPad/4))*ones(1,depth),'r')
    hold on
    plot(1:depth,(meanValue-(devPad/4))*ones(1,depth),'r')
    plot(1:depth,meanValue*ones(1,depth),'g')
end


end
