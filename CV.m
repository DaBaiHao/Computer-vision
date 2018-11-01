 %read the image
img = imread(fullfile('C:','Users','Administrator','Desktop','turtal1','dataset','DatasetA','car-1.jpg'));
%img = imread("CV_NAME_PICTURE.jpg");
[h,w,d]=size(img);



% show the img


%imshow(rotate_30);
%img2 = imread("20.jpg");
% show the img
%shew_10=ICV_Shew(img,50);
% rotate_30=ICV_Rot(shew_10,20);


filter_some = ICV_filter55(img);
%filter_some = ICV_filter(img);
%video = "DatasetB.avi";
%filter_some = ICV_filter(filter_some);
%ICV_video(video);

%imhist(1,img);
imshow(filter_some);