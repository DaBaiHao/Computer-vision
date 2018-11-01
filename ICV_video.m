function ICV_video(video)
 
obj = VideoReader(video);
obj_numberofframe = obj.NumberOfFrame;
 
for m = 1:obj_numberofframe -1
    img = read(obj,m);
    %imshow(frame);
    img2 = read(obj,m + 1);
    [Rows, Cols,slices] = size(img);
   
    % img1 r g b
    img_red = double(img(:,:,1));
    img_green =double( img(:,:,2));
    img_blue = double(img(:,:,3));
       
    % img2 r g b
    img2_red = double(img2(:,:,1));
    img2_green =double( img2(:,:,2));
    img2_blue = double(img2(:,:,3));
   
    % create a new his
    red_his = zeros(1,255);
    green_his = zeros(1,255);
    blue_his = zeros(1,255);
    
    
    % create a new his
    red_his2 = zeros(1,255);
    green_his2 = zeros(1,255);
    blue_his2 = zeros(1,255);
   
    for x = 1:255
        for i = 1:Rows
            for j = 1:Cols
               
                if(img_red(i,j) == x )
                    red_his(x) = red_his(x)+1;
                end
               
                if(img_green(i,j) == x )
                    green_his(x) = green_his(x)+1;
                end
               
                if(img_blue(i,j) == x )
                    blue_his(x) = blue_his(x)+1;
                end
               
                if(img2_red(i,j) == x )
                    red_his2(x) = red_his2(x)+1;
                end
               
                if(img2_green(i,j) == x )
                    green_his2(x) = green_his2(x)+1;
                end
               
                if(img2_blue(i,j) == x )
                    blue_his2(x) = blue_his2(x)+1;
                end
               
               
            end
        end
    end
red_his = ICV_intersection(red_his, red_his2);
green_his = ICV_intersection(green_his, green_his2);
blue_his = ICV_intersection(blue_his, blue_his2);


subplot(3,1,1);
bar(red_his, 'r');
xlabel('red level');
ylabel('Number of pixels');
title('red slices histogram');
 
subplot(3,1,2);
bar(green_his, 'g');
xlabel('green level');
ylabel('Number of pixels');
title('green slices histogram');
 
subplot(3,1,3);
bar(blue_his, 'b');
xlabel('blue level ');
ylabel('Number of pixels');
title('blue slices histogram');
 
   
   
   
   
end
 
end
 

