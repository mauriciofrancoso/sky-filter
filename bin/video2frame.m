%% Step 1: Select the video file to analyze with uigetfile
% uigetfile will prompt the user to select the video file to be analyzed
% and particioned
%
%Before you run this code, you have to set all instances of 'leftImg0' to
%which folder you intend to run. For example 'leftImg1',
%'rightImg0', 'rightImg1', etc.

[FileName, PathName, FilterIndex] = uigetfile({'*.*','All Files'},'Select a file'); %This function will get the file and some data from it

%% Step 2: Access Video with VideoReader
% The |VideoReader| function constructs a multimedia reader object that can
% read video data from a multimedia file.  See <matlab:doc('VideoReader')
% the documentation> for |VideoReader| for information on which formats are
% supported on your platform.
%   
% Use |VideoReader| to access the video and get basic information about it.

VIDEO=VideoReader(strcat(PathName,FileName));

%% Step 3: Explore Video with IMPLAY
% Explore the video in |implay|. 

% implay(FileName);

%% Step 4: Convert all frames to image

% 4.1
% Create a folder to store the image sequence

mkdir(PathName,'disparityImg2'); %you have to change the new folder name you'e creating

% 4.2 It will get trhoug every single frame of Video and will save it

i = 1;

while hasFrame(VIDEO)
   img = readFrame(VIDEO);
   img_gray=rgb2gray(img);
   
   filename_Gray = [sprintf('disparityImg2_%0.0d',i) '.jpg']; %you have to change the name of file you're creating
   fullname_Gray = fullfile(PathName,'disparityImg2',filename_Gray); %same here
   imwrite(img_gray,fullname_Gray)    % Write out to a JPEG file (img1.jpg, img2.jpg, etc.)
   
   i = i+1;
end
