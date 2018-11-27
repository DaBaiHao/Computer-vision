




%%
video = "DatasetC.mpg";
obj = VideoReader(video);
img1 = read(obj,9);
img2 = read(obj,10);

% input Block 16 * 16
block_Size = 16;

% searchingWindows
searching_Windows_size = 20;
img_block = ICV_blockMatch(img1,img2,block_Size,searching_Windows_size)


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
img_path = "face-2.jpg";
img = imread(img_path);
ICV_LBPfunction(img);

