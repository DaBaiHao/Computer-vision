function matchBlock = ICV_blockMatch(img,block_size,search_windows_size)

img = img(:,:,1);

[Rows, Cols,~] = size(img);
%matchBlock = matchBlock(Rows/block_size,Cols/block_size )

% cut to block
block_i = 1;
for i = 1:block_size:(Rows)
    block_j = 1;
    for j = 1:block_size:(Cols)
        
        if ((( i + block_size -1) <  Cols) ||(( j + block_size -1) <  Rows))
            matchBlock(block_i, block_j).block =  img(i:Rows, j:Cols);
        else
            matchBlock(block_i, block_j).block =  img(i:i+block_size-1, j:j+block_size-1);
        end
        matchBlock(block_i, block_j).loction = [i,j];
        block_j = block_j + 1;    
    end
    
    block_i = block_i +1;
end
    




% 
block_i = 1;
for i = 1:block_size: Rows
    block_j = 1;
    for j = 1:block_size: Cols
        
        % Mean_Square_Error
        Mean_Square_Error  = zeros(search_windows_size - block_size + 1, search_windows_size -block_size +1 );
        
        
        
        
        
        
        block_j = block_j + 1;
    end
    block_i = block_i + 1;
end

end

