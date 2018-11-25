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





for i = 1:3:Rows-2
    for j = 1:3: Cols - 2
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
    LBPimg(Rows,:) = [];
end
% delete the use less row and col
if mod(Cols,3) == 1
    LBPimg(:,Cols) = [];
end
if mod(Cols,3) == 2
    LBPimg(:,Cols) = [];
    LBPimg(:,Cols) = [];
end


[Row_LBP, Col_LBP] = size(LBPimg);

% binary
for i = 1:3:Row_LBP-2
    for j = 1:3:Col_LBP-2
        
        
        str = sprintf('%d%d%d%d%d%d%d%d',LBPimg(i, j),LBPimg(i , j+1),LBPimg(i , j+2),LBPimg(i + 1, j+2),LBPimg(i + 2, j+2),LBPimg(i + 2, j+1),LBPimg(i + 2, j),LBPimg(i + 1, j));
        LBPimg(i + 1, j+1) = bin2dec(str);
        
    end
end



%{
% not work
LBP_i = 1;
for i = 1:round(Rows/3)
    LBP_j = 1;
    for j = 1:round(Cols/3)
        
        block_3by3 = blocks{i,j};
        for m = 1: 3
            for n = 1:3
                % left up
                if((block_3by3(m+1,n+1) >= block_3by3(m,n)))
                    
                    LBPimg(LBP_i,LBP_j) = 1;
                else
                    LBPimg(LBP_i,LBP_j) = 0;
                end
                
                % up
                if(block_3by3(m+1,n+1) >= block_3by3(m,n+1))
                    LBPimg(LBP_i,LBP_j+1) = 1;
                else
                    LBPimg(LBP_i,LBP_j+1) = 0;
                end
                
                % right up
                if(block_3by3(m+1,n+1) >= block_3by3(m,n+2))
                    LBPimg(LBP_i,LBP_j+2) = 1;
                else
                    LBPimg(LBP_i,LBP_j+2) = 0;
                end
                
                % left
                if(block_3by3(m+1,n+1) > block_3by3(m+1,n))
                    LBPimg(LBP_i+1,LBP_j) = 1;
                else
                    LBPimg(LBP_i+1,LBP_j) = 0;
                end
                
                % right
                if(block_3by3(m+1,n+1) > block_3by3(m+1,n+2))
                    LBPimg(LBP_i+1,LBP_j+2) = 1;
                else
                    LBPimg(LBP_i+1,LBP_j+2) = 0;
                end
                
                % left down
                if(block_3by3(m+1,n+1) > block_3by3(m+2,n))
                    LBPimg(LBP_i+2,LBP_j) = 1;
                else
                    LBPimg(LBP_i+2,LBP_j) = 0;
                end
                
                % down
                if(block_3by3(m+1,n+1) > block_3by3(m+2,n+1))
                    LBPimg(LBP_i+2,LBP_j+1) = 1;
                else
                    LBPimg(LBP_i+2,LBP_j+1) = 0;
                end
                
                % down right
                if(block_3by3(m+1,n+1) > block_3by3(m+2,n+2))
                    LBPimg(LBP_i+2,LBP_j+2) = 1;
                else
                    LBPimg(LBP_i+2,LBP_j+2) = 0;
                end
                
            end
        end
        LBP_j = LBP_j +3;
    end
    LBP_i = LBP_i + 3;
end
%}


end

