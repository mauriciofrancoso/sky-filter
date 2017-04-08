function []=

[mean_vector,~,aceptationArgLowPass,~] = imgMeanLowPass(depthMovie,false);

[depthMovieRemoved,mean_vector,count,removed] = imgRemovalLowPass( depthMovie, mean_vector, aceptationArgLowPass);

[newDepthMovie,newMeanVector] = removeZeroFrames( depthMovieRemoved,count,mean_vector );

[ depthMovie_filtered ] = FinalFilter( newDepthMovie, newMeanVector);

[mean_vector,devPad,minVal,aceptationArg_highpass,meanValue] = imgMeanHighPass( depthMovie_filtered,false );


[depthMovieRemoved] = imgRemoval( depthMovie_filtered, mean_vector, aceptationArg_highpass);



for i=1:613
    filename=sprintf('/Users/mauriciofrancoso/Desktop/Universidade/Wayne State University/Wayne State University - USA/AT/Signetron/Job/To process/DUO/disparityImg1_Removed/img%0.0d.jpg',i);
    imwrite(mat2gray(depthMovieRemoved(:,:,i)),filename);
end
