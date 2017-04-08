function [depthMovieRemoved,mean_vector,count,removed] = imgRemovalLowPass( depthMovie, mean_vector, aceptationArgLowPass)
% This function will receive depthmovie as a double(i,j,k), the mean vector
% and the aceptation arg and based on these data will remove some frames of
% the video


[row,col,depth]=size(depthMovie);


depthMovieRemoved=depthMovie;
count=0;
%it will run all frames and it will check if its mean it is less than
%acptation arg. if yes, it will make it all zero
for k=1:depth
    if mean_vector(1,k)>aceptationArgLowPass
        removed(1,(count+1))=k;
        count=count+1;
        for i=1:row
            for j=1:col
                depthMovieRemoved(i,j,k)=0;
                mean_vector(1,k)=0;
            end
        end
    end
end
end