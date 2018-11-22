% function input: a video path
function [outputArg1,outputArg2] = ICV_captureMovingObjectPreviousFrame(video_path)


obj = VideoReader(video_path);
obj_numberofframe = obj.NumberOfFrame;

for i = 1:obj_numberofframe -1
    
    % this frame and next frame
    frame_1 = read(obj,i);
    frame_2 = read(obj,i+1);
    
    % calculate row and colom
    [Rows, Cols,~] = size(frame_1);
    
    new_img = zeros(Rows,Cols);
    for m = 1:Rows
        for n = 1:Cols
            
            % ref is the previous frame
            if(frame_1(m,n) ~= frame_2(m,n))
                new_img(m,n) = frame_2(m,n);
            end
            
            
            
        end
    end
    
end
    




end

