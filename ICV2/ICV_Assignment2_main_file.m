
%% 4) Motion estimation
%% 4 - a : Display the motion vectors
% video path
tic;
video = "DatasetC.mpg";
obj = VideoReader(video);
% two consecutive frames
img1 = read(obj,9);
figure(5)
imshow(img1);
img2 = read(obj,10);
figure(6)
imshow(img2);
% input Block 16 * 16
block_Size = 16;

% searchingWindows
searching_Windows_size = 20;

% do Display the motion vectors
% needed input:
%  - first frame
%  - second frame
%  - block Size (if the block is 16 * 16, the size of the block is :16)
%  - searching Windows size (if the searching Windows is 20 * 20, the size of the searching Windows is :20)
img_block = ICV_blockMatch(img1,img2,block_Size,searching_Windows_size);
toc;
%% 4 - b :  Display the image Pt+1, predicted version of It+1,
% video path
video = "DatasetC.mpg";
obj = VideoReader(video);
% two consecutive frames
img1 = read(obj,9);
img2 = read(obj,10);

% input Block 16 * 16
block_Size = 16;

% searchingWindows
searching_Windows_size = 20;

% do Display the motion vectors, and predict img
% needed input:
%  - first frame
%  - second frame
%  - block Size (if the block is 16 * 16, the size of the block is :16)
%  - searching Windows size (if the searching Windows is 20 * 20, the size of the searching Windows is :20)
img_block = ICV_predictionOfFrame(img1,img2,block_Size,searching_Windows_size);


%% 4 - c :  16x16 search window, block_Size 4x4
% video path
tic;
video = "DatasetC.mpg";
obj = VideoReader(video);
% two consecutive frames
img1 = read(obj,9);
img2 = read(obj,10);

% block_Size 4x4
block_Size = 4;

% 16x16 search window,
searching_Windows_size = 16;

% do Display the motion vectors
% needed input:
%  - first frame
%  - second frame
%  - block Size (if the block is 16 * 16, the size of the block is :16)
%  - searching Windows size (if the searching Windows is 20 * 20, the size of the searching Windows is :20)
img_block = ICV_blockmatch_se16(img1,img2,block_Size,searching_Windows_size);
toc;
%% 4 - c :  16x16 search window, block_Size 16
% video path
tic;
video = "DatasetC.mpg";
obj = VideoReader(video);
% two consecutive frames
img1 = read(obj,9);
img2 = read(obj,10);

% block_Size 4x4
block_Size = 16;

% 16x16 search window,
searching_Windows_size = 16;

% do Display the motion vectors
% needed input:
%  - first frame
%  - second frame
%  - block Size (if the block is 16 * 16, the size of the block is :16)
%  - searching Windows size (if the searching Windows is 20 * 20, the size of the searching Windows is :20)
img_block = ICV_blockmatch_se16_mb16(img1,img2,block_Size,searching_Windows_size);
toc;
%% 4 - c :  16x16 search window, block_Size 88
% video path
tic;
video = "DatasetC.mpg";
obj = VideoReader(video);
% two consecutive frames
img1 = read(obj,9);
img2 = read(obj,10);

% block_Size 4x4
block_Size = 8;

% 16x16 search window,
searching_Windows_size = 16;

% do Display the motion vectors
% needed input:
%  - first frame
%  - second frame
%  - block Size (if the block is 16 * 16, the size of the block is :16)
%  - searching Windows size (if the searching Windows is 20 * 20, the size of the searching Windows is :20)
img_block = ICV_blockmatch_se16_mb88(img1,img2,block_Size,searching_Windows_size);
toc;
%% 4 - d :  88 search window, block_Size 88
% video path
tic;
video = "DatasetC.mpg";
obj = VideoReader(video);
% two consecutive frames
img1 = read(obj,9);
img2 = read(obj,10);

% block_Size 4x4
block_Size = 8;

% 16x16 search window,
searching_Windows_size = 8;

% do Display the motion vectors
% needed input:
%  - first frame
%  - second frame
%  - block Size (if the block is 16 * 16, the size of the block is :16)
%  - searching Windows size (if the searching Windows is 20 * 20, the size of the searching Windows is :20)
img_block = ICV_blockmatch_se88_mb88(img1,img2,block_Size,searching_Windows_size);
toc;
%% 4 - d :  16 search window, block_Size 88
% video path
tic;
video = "DatasetC.mpg";
obj = VideoReader(video);
% two consecutive frames
img1 = read(obj,9);
img2 = read(obj,10);

% block_Size 4x4
block_Size = 8;

% 16x16 search window,
searching_Windows_size = 16;

% do Display the motion vectors
% needed input:
%  - first frame
%  - second frame
%  - block Size (if the block is 16 * 16, the size of the block is :16)
%  - searching Windows size (if the searching Windows is 20 * 20, the size of the searching Windows is :20)
img_block = ICV_blockmatch_se88_mb88(img1,img2,block_Size,searching_Windows_size);
toc;
%% 4 - d :  32 search window, block_Size 88
% video path
tic;
video = "DatasetC.mpg";
obj = VideoReader(video);
% two consecutive frames
img1 = read(obj,9);
img2 = read(obj,10);

% block_Size 4x4
block_Size = 8;

% 16x16 search window,
searching_Windows_size = 32;

% do Display the motion vectors
% needed input:
%  - first frame
%  - second frame
%  - block Size (if the block is 16 * 16, the size of the block is :16)
%  - searching Windows size (if the searching Windows is 20 * 20, the size of the searching Windows is :20)
img_block = ICV_blockmatch_se88_mb88(img1,img2,block_Size,searching_Windows_size);
toc;
%% 2-1
video_path = "DatasetC.mpg";
obj = VideoReader(video_path);
% two consecutive frames
img1 = read(obj,1);
figure(1);
imshow(img1);

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

img_path = "face-2.jpg";

img = imread(img_path);
img = rgb2gray(img);

block = 128;
imgs = ICV_divideIntoNonOverlapping(img,block);
[~,~,number] = size(imgs);

for i = 1:number
    figure(i)
    img = imgs(:,:,i);
    img_i = ICV_LBPfunction(img);
    figure(number + 1)
    his(i,:) = ICV_hisgram(img_i, number,i);
    
    his_new(i,:) = normalize(his(i,:), 'norm', 1);
    figure(number + 2)
    subplot(number,1,i);
    plot(his_new(i,:), 'b');
    xlabel('gray level');
    ylabel('Number of pixels');
    title('gray histogram');
    
end

%% 3 -2
% read the car
img_path = "face-2.jpg";

img = imread(img_path);
img = rgb2gray(img);

block = 128;
imgs = ICV_divideIntoNonOverlapping(img,block);
[~,~,number] = size(imgs);

for i = 1:number
    figure(i)
    img = imgs(:,:,i);
    img_i = ICV_LBPfunction(img);
    figure(number + 1)
    his(i,:) = ICV_hisgram(img_i, number,i);
    
    his_new(i,:) = normalize(his(i,:), 'norm', 1);
    figure(number + 2)
    subplot(number,1,i);
    plot(his_new(i,:), 'b');
    xlabel('gray level');
    ylabel('Number of pixels');
    title('gray histogram');
    
end


[rows,cols] = size(his);
his_all = zeros(1,cols);
for i = 1:rows
    for j = 1:cols
        his_all(j) = his_all(j) + his(i,j);
    end
end
figure(number + 3)
bar(his_all, 'g');
xlabel('gray level');
ylabel('Number of pixels');
title('gray histogram');

%% 3-3
img_path = "car-1.jpg";


img = imread(img_path);
img = rgb2gray(img);

block = 128;
imgs = ICV_divideIntoNonOverlapping(img,block);
[~,~,number] = size(imgs);

for i = 1:number
    figure(i)
    img = imgs(:,:,i);
    img_i = ICV_LBPfunction(img);
    figure(number + 1)
    his(i,:) = ICV_hisgram(img_i, number,i);
    
    his_new(i,:) = normalize(his(i,:), 'norm', 1);
    figure(number + 2)
    subplot(number,1,i);
    plot(his_new(i,:), 'b');
    xlabel('gray level');
    ylabel('Number of pixels');
    title('gray histogram');
    
end


[rows,cols] = size(his);
his_all = zeros(1,cols);
for i = 1:rows
    for j = 1:cols
        his_all(j) = his_all(j) + his(i,j);
    end
end
for i = 1:cols
    his_all(i) = his_all(i)/rows;
end
disp(sum(his_all));
figure(number + 3)
bar(his_all, 'g');
xlabel('gray level');
ylabel('Number of pixels');
title('gray histogram');
hold off;
% read the face


img_path = "face-2.jpg";


img = imread(img_path);
img = rgb2gray(img);

block = 128;
imgs = ICV_divideIntoNonOverlapping(img,block);
[~,~,number] = size(imgs);

for i = 1:number
    figure(i)
    img = imgs(:,:,i);
    img_i = ICV_LBPfunction(img);
    figure(number + 1)
    his(i,:) = ICV_hisgram(img_i, number,i);
    
    his_new(i,:) = normalize(his(i,:), 'norm', 1);
    figure(number + 2)
    subplot(number,1,i);
    plot(his_new(i,:), 'b');
    xlabel('gray level');
    ylabel('Number of pixels');
    title('gray histogram');
    
end


[rows,cols] = size(his);
his_all2 = zeros(1,cols);
for i = 1:rows
    for j = 1:cols
        %disp(sum(his(i,:)));
        his_all2(j) = his_all2(j) + his(i,j);
    end
end
for i = 1:cols
    his_all2(i) = his_all2(i)/rows;
end
disp(sum(his_all2));
figure(number + 4)
bar(his_all2, 'black');
xlabel('gray level');
ylabel('Number of pixels');
title('gray histogram');

for i = 1:cols
    if(his_all(i) < his_all2(i) )
        his_intersction(i) = his_all(i);
    else
        his_intersction(i) = his_all2(i);
    end
end

disp(sum(his_intersction));

figure(number + 5)
bar(his_intersction, 'b');

