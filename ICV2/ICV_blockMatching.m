
function [outputArg1,outputArg2] = ICV_blockMatching(img, input_block, search_windows_size,loctionX,loctionY,block_Size)


% find the size of the input block
[inputBlock_rows, inputBlock_cols] = size(inputBlock);
[Rows, Cols,~] = size(img);

%{
for i = 1 : block_Size :  Rows
    a = (i-1)/block_Size + 1; 
    
    for j = 1 : block_Size :  Cols
        
    end
end

%}





input_block = double(input_block);
% create Mean_Square_Error 
Mean_Square_Error_Rows = search_windows_size - inputBlock_rows+1;
Mean_Square_Error_Cols = search_windows_size - inputBlock_cols+1;
Mean_Square_Error  = zeros(Mean_Square_Error_Rows , Mean_Square_Error_Cols);


% matchingWindow from locX to loctionX + windowSize - 1
matchingWindow = double(img(locX : (loctionX + windowSize - 1), loctionY : (loctionY + windowSize - 1)));


for i = 1 : (search_windows_size - inputBlock_rows + 1)
    for j = 1 : (search_windows_size - inputBlock_cols + 1)
        temp = matchingWindow(i : i+ inputBlock_rows - 1, j : j + inputBlock_cols - 1);
        tempMean_Square_Error = (temp - input_block) .^ 2;
        Mean_Square_Error(i, j) = sum(sum(tempMean_Square_Error));
        
    end
end

min_Mean_Square_Error = min(min(Mean_Square_Error));
[min_Mean_Square_Error_x, min_Mean_Square_Error_y] = find( Mean_Square_Error == min_Mean_Square_Error);


end

