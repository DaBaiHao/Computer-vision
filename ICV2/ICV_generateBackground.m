% function input: a video path
function backgroundImg =  ICV_generateBackground(video_path)


obj = VideoReader(video_path);
obj_numberofframe = obj.NumberOfFrame;

frameEach = read(obj,1);
[Rows, Cols,~] = size(frameEach);
 
backgroundImg = zeros(Rows,Cols,3);

for i = 1:obj_numberofframe -1
    
    % this frame and next frame
    frame = read(obj,i);
    % RGB level
    % red 
    backgroundImg(:,:,1) = double(frame(:,:,1))+backgroundImg(:,:,1);
    % green
    backgroundImg(:,:,2) = double(frame(:,:,2))+backgroundImg(:,:,2);
    % blue
    backgroundImg(:,:,3) = double(frame(:,:,3))+backgroundImg(:,:,3);
    

end
    
backgroundImg(:,:,1)=uint8(backgroundImg(:,:,1)*1/obj_numberofframe);
backgroundImg(:,:,2)=uint8(backgroundImg(:,:,2)*1/obj_numberofframe);
backgroundImg(:,:,3)=uint8(backgroundImg(:,:,3)*1/obj_numberofframe);

backgroundImg = uint8(backgroundImg);

imshow(backgroundImg);

end

