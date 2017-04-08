function [ depthMovie_filtered] = FinalFilter( depthMovie )
% This function will receive depthmovie as a double(i,j,k) and will filter
% based on FilterSky function



[~,col,depth]=size(depthMovie); %take the size of depth movie

depthMovie_filtered=depthMovie; %create the output


for k=1:depth %to run all frames
    [ ~, ~,line] = FilterSky( depthMovie(:,:,k)); %filter each frame individually
    for i=1:line
        for j=1:col
            depthMovie_filtered(i,j,k)=0; %replace with zeros the sky
            
        end
    end
end
end


