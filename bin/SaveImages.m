%Save the images filtered

%You have to adjust the path and the for i vector


for i=1:613
    filename=sprintf('/Users/mauriciofrancoso/Desktop/Universidade/Wayne State University/Wayne State University - USA/AT/Signetron/Job/To process/DUO/disparityImg1_Removed/img%0.0d.jpg',i);
    imwrite(mat2gray(depthMovieRemoved(:,:,i)),filename);
end
