 %read the image
img = imread(fullfile('C:','Users','Administrator','Desktop','turtal1','dataset','DatasetA','car-1.jpg'));
%img = imread("CV_NAME_PICTURE.jpg");
[h,w,d]=size(img);
video = "DatasetB.avi";
obj = VideoReader(video);
img = read(obj,299);
imshow(img);
% show the img


%imshow(rotate_30);
%img2 = imread("20.jpg");
% show the img
%shew_10=ICV_Shew(img,50);
% rotate_30=ICV_Rot(shew_10,20);


%filter_some = ICV_filter77(img);
%filter_some = ICV_filter(img);
%video = "DatasetB.avi";
%filter_some = ICV_filter(filter_some);
%ICV_video(video);

%imhist(1,img);
%imshow(filter_some);

%% question3a_1
video = "DatasetB.avi";
obj = VideoReader(video);
img = read(obj,1);
ICV_histogram(img);
%% question3a_2
video = "DatasetB.avi";
obj = VideoReader(video);
img = read(obj,299);
ICV_histogram(img);
%% question3b_1 using frame 3
video = "DatasetB.avi";
obj = VideoReader(video);
img = read(obj,3);
ICV_histogram(img);
%% question3b_2 using frame 3+1
video = "DatasetB.avi";
obj = VideoReader(video);
img = read(obj,4);
ICV_histogram(img);
%% question3b_3 using frame 3and4 Intersection  
video = "DatasetB.avi";
obj = VideoReader(video);
img1 = read(obj,3);
img2 = read(obj,4);
ICV_histogram(img);
