% function input: a video path
function ICV_generateRefFrame(video_path, classification_threshold)


obj = VideoReader(video_path);
obj_numberofframe = obj.NumberOfFrame;

frameEach = read(obj,1);
[Rows, Cols,~] = size(frameEach);
 
backgroundImg = uint8(zeros(Rows,Cols,3));

for i = 1:obj_numberofframe -1
    
    % this frame and next frame
    frame_1 = read(obj,i);
    frame_2 = read(obj,i+1);
    
    % calculate row and colom
   
    
    new_img = uint8(zeros(Rows,Cols));
    
    for m = 1:Rows
        for n = 1:Cols
            
            % ref is the previous frame
            
                
                if(frame_1(m,n) ~= frame_2(m,n) && abs(frame_2(m,n)- frame_1(m,n)) > classification_threshold   )
                  new_img(m,n) = 255;
                else
                  new_img(m,n) = 0;
                end
                
                
            
            
            
            
        end
    end
    figure(1);
    imshow(new_img);
    
    figure(2);
    if(new_img(m,n) == 0 && backgroundImg(m,n) == 0)
        for h = 1:3
            backgroundImg(m,n,h) = frame_1(m,n,h);
        end
    end
    imshow(backgroundImg);
    

end
    




end

