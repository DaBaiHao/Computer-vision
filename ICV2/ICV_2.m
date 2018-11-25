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
ICV_captureMovingObjectPreviousFrame(video_path,20);

%% 2-3
video_path = "DatasetC.mpg";
backgroundImg = ICV_generateBackground(video_path);


%% 2-4
video_path = "DatasetC.mpg";
backgroundImg = ICV_generateBackground(video_path);
ICV_countMovingObject(backgroundImg,video_path,34);


%% 3 -1
video_path = "DatasetC.mpg";
obj = VideoReader(video_path);
frame_1 = read(obj,1);
ICV_LBPfunction(frame_1);

