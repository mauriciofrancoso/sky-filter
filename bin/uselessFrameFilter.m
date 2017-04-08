function [newDepthMovie]= uselessFrameFilter(depthMovie)

[mean_vector,~,aceptationArgLowPass,~] = imgMeanLowPass(depthMovie,true);

[depthMovieRemoved,mean_vector,count,~] = imgRemovalLowPass( depthMovie, mean_vector, aceptationArgLowPass);

[newDepthMovie,~] = removeZeroFrames( depthMovieRemoved,count,mean_vector );

[ depthMovie_filtered ] = FinalFilter( newDepthMovie);

[mean_vector,~,~,aceptationArgHighPass,~] = imgMeanHighPass( depthMovie_filtered,true );


[depthMovieRemoved,new_mean_vector,count,~] = imgRemovalHighPass( depthMovie_filtered, mean_vector, aceptationArgHighPass);

[newDepthMovie,~] = removeZeroFrames( depthMovieRemoved,count,new_mean_vector );

[~,~,depth]=size(newDepthMovie);



for i=1:depth
    
    filename=sprintf('/Users/mauriciofrancoso/Desktop/Universidade/Wayne State University/Wayne State University - USA/AT/Signetron/Job/To process/08182016/disparityImg2Filtered/img%0.0d.jpg',i);
    imwrite(mat2gray(newDepthMovie(:,:,i)),filename);
end

end
