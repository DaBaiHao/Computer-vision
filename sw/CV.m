 %read the image
%img = imread(fullfile('C:','Users','Administrator','Desktop','turtal1','dataset','DatasetA','car-1.jpg'));
%img = imread("CV_NAME_PICTURE.jpg");
%[h,w,d]=size(img);
video = "DatasetB.avi";
obj = VideoReader(video);
img = read(obj,299);
imshow(img);
% show the img


%imshow(rotate_30);
%img2 = imread("20.jpg");
% show the img

%% skew an image
img = imread("car-1.jpg");
shew_10=ICV_Shew(img,50);
%%
img = imread("car-1.jpg");
rotate_30=ICV_Rot(shew_10,20);


%% question2a 55 AB
img = imread("car-1.jpg");
filter_some = ICV_filter55(img);
filter_some = ICV_filter55B(filter_some);
imshow(filter_some);

%% question2a 55 BA
img = imread("car-1.jpg");
filter_some = ICV_filter55B(img);
filter_some = ICV_filter55(filter_some);
imshow(filter_some);

%% question2a 77 A
img = imread("car-1.jpg");
%filter_some = ICV_filter55B(img);
filter_some = ICV_filter77(img);
imshow(filter_some);

%% question2a 77 AB
img = imread("car-1.jpg");
%filter_some = ICV_filter55B(img);
filter_some = ICV_filter77(img);
filter_some = ICV_filter55B(filter_some);
imshow(filter_some);
%% question2a 77 BA
img = imread("car-1.jpg");
filter_some = ICV_filter55B(img);
filter_some = ICV_filter77(filter_some);
%filter_some = ICV_filter55B(filter_some);
imshow(filter_some);
%% question2c AA
img = imread("car-1.jpg");
filter_some = ICV_filter(img);
filter_some = ICV_filter(filter_some);
imshow(filter_some);
%% question2c B
img = imread("car-1.jpg");
filter_some = ICV_filterB(img);
%filter_some = ICV_filter(filter_some);
imshow(filter_some);
%% question2c A B
img = imread("car-1.jpg");
filter_some = ICV_filter(img);
filter_some = ICV_filterB(filter_some);
imshow(filter_some);

%% question2c B A
img = imread("car-1.jpg");
filter_some = ICV_filterB(img);
filter_some = ICV_filter(filter_some);
imshow(filter_some);
%% question2c 55 A A
img = imread("car-1.jpg");
filter_some = ICV_filter55(img);
%filter_some = ICV_filter55(filter_some);
imshow(filter_some);
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
ICV_compareTwoframe(img1,img2);
%% question3b_4 using frame 9 
video = "DatasetB.avi";
obj = VideoReader(video);
img = read(obj,9);

ICV_histogram(img);
%% question3b_5 using frame 10
video = "DatasetB.avi";
obj = VideoReader(video);
img = read(obj,10);
%imshow(img);
ICV_histogram(img);
%% question3b_6 using frame 3and4 Intersection  
video = "DatasetB.avi";
obj = VideoReader(video);
img1 = read(obj,9);
img2 = read(obj,10);
ICV_compareTwoframe(img1,img2);

%% question4 
video = "DatasetB.avi";
obj = VideoReader(video);
img1 = read(obj,9);
img2 = read(obj,10);



