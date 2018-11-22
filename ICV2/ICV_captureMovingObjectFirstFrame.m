% function input: a video path
function ICV_captureMovingObjectFirstFrame(video_path, classification_threshold)


obj = VideoReader(video_path);
obj_numberofframe = obj.NumberOfFrame;

for i = 1:obj_numberofframe -1
    
    % this frame and next frame
    frame_1 = read(obj,1);
    frame_2 = read(obj,i+1);
    
    % calculate row and colom
    [Rows, Cols,~] = size(frame_1);
    
    new_img = uint8(zeros(Rows,Cols));
    for m = 1:Rows
        for n = 1:Cols
            
            % ref is the previous frame
            for z = 1: 3
                
                if(frame_1(m,n) ~= frame_2(m,n) && frame_2(m,n) < classification_threshold  )
                  new_img(m,n) = 255;
                else
                  new_img(m,n) = 0;
                end
                
                
            end
            
            
            
        end
    end
    
    imshow(new_img);

end
    




end

