%%
video = "DatasetB.avi";
obj = VideoReader(video);
img1 = read(obj,9);
img2 = read(obj,10);

% input Block 16 * 16
inputBlock = ones(16,16);



%% 2-1
video_path = "DatasetC.mpg";
ICV_captureMovingObjectFirstFrame(video_path,40);
%% 2-2
video_path = "DatasetC.mpg";
ICV_captureMovingObjectPreviousFrame(video_path,30);


