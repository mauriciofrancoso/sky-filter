function [depthMovieRemoved] = imgRemoval( depthMovie, mean_vector, aceptationArg)
% This function will receive depthmovie as a double(i,j,k), the mean vector
% and the aceptation arg and based on these data will remove some frames of
% the video


[row,col,depth]=size(depthMovie);


depthMovieRemoved=depthMovie;

%it will run all frames and it will check if its mean it is less than
%acptation arg. if yes, it will make it all zero
for k=1:depth
    if mean_vector(1,k)<aceptationArg
        fprintf('The frame %0.0f has been replaced by all zeros\n',k);
        for i=1:row
            for j=1:col
                depthMovieRemoved(i,j,k)=0;
            end
        end
    end
end
end