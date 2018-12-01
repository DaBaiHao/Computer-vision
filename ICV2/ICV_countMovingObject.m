function number = ICV_countMovingObject(backgroundImg, video_path, classification_threshold)


obj = VideoReader(video_path);
obj_numberofframe = obj.NumberOfFrame;
frame_1 = read(obj,1);
[Rows, Cols,~] = size(frame_1);

for i = 1:obj_numberofframe
    
    frame_each = read(obj,i);
    new_img = uint8(zeros(Rows,Cols));
    for n = 1 : Rows
        for m = 1 : Cols
            
            if(abs(backgroundImg(n,m) - frame_each(n,m)) > classification_threshold)
                new_img(n,m) = 255;
            else
                new_img(n,m) = 0;
            end
            
            
        end
    end
    
    % imshow(new_img);
    after_filtered_image = ICV_filter77(new_img);
    after_filtered_image = ICV_filter77(after_filtered_image);
    for n = 1 : Rows
        for m = 1 : Cols
            if (after_filtered_image(n,m) ~= 255 && after_filtered_image(n,m) ~= 0)
                after_filtered_image(n,m) = 255;
            end
        end
    end
    imshow(after_filtered_image);
    
    count = ICV_countHowManyConnectInMatrix(after_filtered_image);
   
    disp(count);
    number(i) = count;
end





end

