function [newDepthMovie,newMeanVector] = removeZeroFrames( depthMovieRemoved,count,mean_vector )
% This function will receive depthmovie as a double(i,j,k), the mean vector
% and the aceptation arg and based on these data will remove some frames of
% the video


[row,col,depth]=size(depthMovieRemoved);
newDepth=depth-count;

newDepthMovie=zeros(row,col,newDepth);

newMeanVector=nan(1,newDepth);

a=1;

for k=1:depth
    if mean_vector(1,k)~=0
        newDepthMovie(:,:,a)=depthMovieRemoved(:,:,k);
        a=a+1;
    end
end
for k=1:newDepth
    a=newDepthMovie(:,:,k);
    newMeanVector(1,k)=mean(mean((a)));
end
end
