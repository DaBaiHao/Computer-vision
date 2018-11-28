function ICV_LBPfunction(img)

% greyscale
img_grayLevel = img(:,:,1);




[Rows, Cols,~] = size(img_grayLevel);


blocks = cell(round(Rows/3),round(Cols/3));


% calculate the 3*3 non overlapping
count_i = 0;
for i = 1: 3 : Rows-2
    count_i = count_i + 1;
    count_j = 0;
    for j = 1: 3: Cols-2
        count_j = count_j + 1;
        blocks{count_i,count_j} = img_grayLevel(i:i + 2,j:j + 2);
    end
end

LBPimg = img_grayLevel;





for i = 1:Rows-2
    for j = 1: Cols - 2
        % left up
        if((img_grayLevel(i+1,j+1) >= img_grayLevel(i,j)))
            
            LBPimg(i,j) = 1;
        else
            LBPimg(i,j) = 0;
        end
        
        % up
        if(img_grayLevel(i+1,j+1) >= img_grayLevel(i,j+1))
            LBPimg(i,j + 1) = 1;
        else
            LBPimg(i,j + 1) = 0;
        end
        
        % right up
        if(img_grayLevel(i+1,j+1) >= img_grayLevel(i,j+2))
            LBPimg(i,j + 2) = 1;
        else
            LBPimg(i,j + 2) = 0;
        end
        
        % left
        if(img_grayLevel(i+1,j+1) > img_grayLevel(i + 1,j))
            LBPimg(i + 1,j) = 1;
        else
            LBPimg(i + 1,j) = 0;
        end
        
        % right
        if(img_grayLevel(i+1,j+1) > img_grayLevel(i + 1,j + 2))
            LBPimg(i+1,j+2) = 1;
        else
            LBPimg(i+1,j+2) = 0;
        end
        
        % left down
        if(img_grayLevel(i+1,j+1) > img_grayLevel(i+2,j))
            LBPimg(i+2,j) = 1;
        else
            LBPimg(i+2,j) = 0;
        end
        
        % down
        if(img_grayLevel(i+1,j+1) > img_grayLevel(i+2,j+1))
            LBPimg(i+2,j+1) = 1;
        else
            LBPimg(i+2,j+1) = 0;
        end
        
        % down right
        if(img_grayLevel(i+1,j+1) > img_grayLevel(i+2,j+2))
            LBPimg(i+2,j+2) = 1;
        else
            LBPimg(i+2,j+2) = 0;
        end
    end
end

% delete the use less row and col
if mod(Rows,3) == 1
    LBPimg(Rows,:) = [];
end
if mod(Rows,3) == 2
    LBPimg(Rows,:) = [];
    LBPimg(Rows-1,:) = [];
end
% delete the use less row and col
if mod(Cols,3) == 1
    LBPimg(:,Cols) = [];
end
if mod(Cols,3) == 2
    LBPimg(:,Cols) = [];
    LBPimg(:,Cols-1) = [];
end


[Row_LBP, Col_LBP] = size(LBPimg);

LBPimg2= LBPimg;
% binary
for i = 1:Row_LBP-2
    for j = 1:Col_LBP-2
        
        
        str = sprintf('%d%d%d%d%d%d%d%d',LBPimg(i, j),LBPimg(i , j+1),LBPimg(i , j+2),LBPimg(i + 1, j+2),LBPimg(i + 2, j+2),LBPimg(i + 2, j+1),LBPimg(i + 2, j),LBPimg(i + 1, j));
        LBPimg2(i + 1, j+1) = bin2dec(str);
        
    end
end


imshow(LBPimg2);


end

