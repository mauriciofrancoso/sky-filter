function [depthMovieRemoved,new_mean_vector,count,removed] = imgRemovalHighPass( depthMovie, new_mean_vector, aceptationArgHighPass)
% This function will receive depthmovie as a double(i,j,k), the mean vector
% and the aceptation arg and based on these data will remove some frames of
% the video


[row,col,depth]=size(depthMovie);


depthMovieRemoved=depthMovie;
count=0;
%it will run all frames and it will check if its mean it is less than
%acptation arg. if yes, it will make it all zero
for k=1:depth
    if new_mean_vector(1,k)<aceptationArgHighPass
        removed(1,(count+1))=k;
        count=count+1;
        for i=1:row
            for j=1:col
                depthMovieRemoved(i,j,k)=0;
                new_mean_vector(1,k)=0;
            end
        end
    end
end
end