% function input: a video path
function ICV_generateRefFrame(video_path, classification_threshold)


obj = VideoReader(video_path);
obj_numberofframe = obj.NumberOfFrame;

frameEach = read(obj,1);
[Rows, Cols,~] = size(frameEach);
 
backgroundImg = zeros(Rows,Cols,3);

for i = 1:obj_numberofframe -1
    
    % this frame and next frame
    frame = read(obj,i);
    backgroundImg(:,:,1) = double(frame(:,:,1))+backgroundImg(:,:,1);
    backgroundImg(:,:,2) = double(frame(:,:,2))+backgroundImg(:,:,2);
    backgroundImg(:,:,3) = double(frame(:,:,3))+backgroundImg(:,:,3);
    

end
    
backgroundImg(:,:,1)=uint8(backgroundImg(:,:,1)*1/obj_numberofframe);
backgroundImg(:,:,2)=uint8(backgroundImg(:,:,2)*1/obj_numberofframe);
backgroundImg(:,:,3)=uint8(backgroundImg(:,:,3)*1/obj_numberofframe);


imshow(uint8(backgroundImg));

end

