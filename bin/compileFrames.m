function [depthMovie] = compileFrames( PathName, VideoNumber, FirstFrame, NumOfFrames)
%PathName is a string representing the addres of the folder that contains
%the both folders (disparity Image and Left Image). The code will consider
%the there are
%
%VideoNumber is the number of video you would like to compile. Like each
%set has a lot of videos (already exported as frames), you will choose one
%to compile
%
%FirstFrame is the number of the first frame the code will start compiling
%
%
%NumOfFrames is the number of frames in sequence this code will compile
%
%

FinalFrame=FirstFrame+NumOfFrames;
steps = FirstFrame:1:FinalFrame;

dispImgFolder=sprintf('disparityImg%0.1d',VideoNumber);
leftImgFolder=sprintf('leftImg%0.1d',VideoNumber);

count=1;

for i=steps
    disparity= fullfile(PathName,dispImgFolder,[sprintf('%s_%0.1d',dispImgFolder,i) '.jpg']);
    %leftimage= fullfile(PathName,leftImgFolder,[sprintf('%s_%0.1d',leftImgFolder,i) '.jpg']);
    
    ImgDisp=double(imread(disparity));
    %ImgLight=double(imread(leftimage));
    
    if count==1
        depthMovie=ImgDisp;
    %    lightMovie=ImgLight;
        count=0;
    else
        depthMovie=cat(3,depthMovie,ImgDisp);
     %   lightMovie=cat(3,lightMovie,ImgLight);
    end
end
end
