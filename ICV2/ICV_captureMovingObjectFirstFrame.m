% function input: a video path
function  ICV_captureMovingObjectFirstFrame(video_path)


obj = VideoReader(video_path);
obj_numberofframe = obj.NumberOfFrame;

for i = 1:obj_numberofframe -1
    
    % this frame and next frame
    reference_frame = read(obj,1);
    frame_2 = read(obj,i+1);
    
    % calculate row and colom
    [Rows, Cols,~] = size(reference_frame);
    
    new_img = zeros(Rows,Cols,3);
    
    for m = 1:Rows
        for n = 1:Cols
            
            for z = 1: 3
                % ref is the first frame
                if(reference_frame(m,n,z) ~= frame_2(m,n,z))
                  new_img(m,n,z) = frame_2(m,n,z);
                end
            end
            
            
            
            
        end
    end
    imshow(new_img);
    
end
    





end

