function img_block = ICV_blockmatch_se16_mb88(img,img_next,block_size,search_windows_size)

img = double(rgb2gray(img));
img_next = double(rgb2gray(img_next));
[Rows, Cols,~] = size(img);

if (mod(Rows,block_size) ~= 0)
    for i = 1: mod(Rows,block_size)
        img(i,:) = [];
        img_next(i,:) = [];
    end
end

if (mod(Cols,block_size) ~= 0)
    for i = 1: mod(Cols,block_size)
        img(:,i) = [];
        img_next(:,i) = [];
    end
end
[Rows, Cols,~] = size(img);


%matchBlock = matchBlock(Rows/block_size,Cols/block_size )

% cut to block
block_i = 1;
for i = 1:block_size:(Rows)
    block_j = 1;
    for j = 1:block_size:(Cols)
        % matching block
        
        matchBlock =  img(i:i+block_size-1, j:j+block_size-1);
            
        
        img_block(block_i, block_j).matchBlock = matchBlock;
        img_block(block_i, block_j).loc = [i,j];
        
        
        % search_windows_row_begin
        if ((i - (search_windows_size - block_size)/2) < 0)
            search_windows_row_begin = 1;
        else
            search_windows_row_begin = i - (search_windows_size - block_size)/2;
        end
        % search_windows_col_begin
        if ((j - (search_windows_size - block_size)/2) < 0)
            search_windows_col_begin = 1;
        else
            search_windows_col_begin = j - (search_windows_size - block_size)/2;
        end
        % search_windows_row_end
        if ( i + block_size -1 +(search_windows_size - block_size)/2 > Rows)
            search_windows_row_end = Rows;
        else
            search_windows_row_end = i + block_size -1 +(search_windows_size - block_size)/2;
        end
        % search_windows_col_end
        if (j + block_size -1 + (search_windows_size - block_size)/2 > Cols)
            search_windows_col_end = Cols;
        else
            search_windows_col_end = j + block_size -1 + (search_windows_size - block_size)/2;
        end
        % search windows
        searchingWindow = img_next(search_windows_row_begin:search_windows_row_end, search_windows_col_begin:search_windows_col_end);
        %  block in search windows search in
        [searchingWindow_row, searchingWindow_col] = size(searchingWindow);
        Mean_Square_Error   = zeros((search_windows_size - block_size+1), (search_windows_size - block_size+1));
        
        for m = 1 : searchingWindow_row - block_size+1
            for n = 1 : searchingWindow_col - block_size+1
                temp_Matching_Block = searchingWindow(m : m+block_size-1, n : n+block_size-1);
                temp_Mean_Square_Error = (temp_Matching_Block - matchBlock) .^ 2;
                Mean_Square_Error(m, n) = sum(sum(temp_Mean_Square_Error));
            end
        end
        min_Mean_Square_Error = min(min(Mean_Square_Error));
        [min_Mean_Square_Error_x, min_Mean_Square_Error_y]=find(Mean_Square_Error==min_Mean_Square_Error);
        
        img_block(block_i, block_j).min_Mean_Square_Error_x_y = [min_Mean_Square_Error_x, min_Mean_Square_Error_y];
        
        pointX(block_i, block_j) = min_Mean_Square_Error_x(1)-(search_windows_size - block_size)/2-1 ;
        pointY(block_i, block_j) = min_Mean_Square_Error_y(1)-(search_windows_size - block_size)/2-1 ;
        
        img_block(block_i, block_j).pointX  =  pointX(block_i, block_j);
        img_block(block_i, block_j).pointY  =  pointY(block_i, block_j);
        block_j = block_j + 1;
    end
    
    block_i = block_i +1;
end

figure(1);
imagesc([1 Cols], [1 Rows], img);
hold on;
xticks(1 : block_size :Cols);
yticks(1 : block_size : Rows);

grid on;        
% length(x)=n �� length(y) = m������ [m,n] = size(u) = size(v)��

% (1 + (block_size/2): block_size : (Rows - block_size) ) 
% (1 + (block_size/2) : block_size : (Cols - block_size)) 
%n = length((1 + (block_size/2): block_size : Rows )) ;
%m = length((1 + (block_size/2) : block_size : Cols ))
%[a,b] = size(pointX);
quiver( 1 + (block_size/2) : block_size : Cols  ,  1 + (block_size/2): block_size : Rows  , pointY,pointX);


%img_next = double(rgb2gray(img_next));
img_pred = img;
block_i = 1;
for i = 1  : block_size :Rows
    
    block_j = 1;
    for j = 1 :block_size:Cols
        % 4.	If the pointer location is not equals to 0, the image block will over-write the pointer location block.
        if (img_block(block_i, block_j).pointY  ~= 0||img_block(block_i, block_j).pointX  ~= 0)
            block_rows_begin = i + img_block(block_i, block_j).pointY;
            
            block_cols_begin = j + img_block(block_i, block_j).pointX;
            
            if block_rows_begin<0
                block_rows_begin = 1;
            end
            
            if block_cols_begin<0
                block_cols_begin = 1;
            end
            
            img_pred(block_rows_begin: block_rows_begin + block_size -1 , block_cols_begin: block_cols_begin + block_size -1 ) = img(i:i + block_size-1, j:j +block_size -1 );
            
            
        end
        
        
        block_j = block_j + 1;
    end
    block_i = block_i + 1;
end

figure(2)
imshow(uint8(img_pred));
figure(3)
imshow(uint8(img_next));
figure(4)
imshow(uint8(img));

end

