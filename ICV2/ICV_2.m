%%
video = "DatasetB.avi";
obj = VideoReader(video);
img1 = read(obj,9);
img2 = read(obj,10);

% input Block 16 * 16
inputBlock = ones(16,16);

