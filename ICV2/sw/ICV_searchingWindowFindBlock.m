function Mean_Square_Error = ICV_searchingWindowFindBlock(searchingWindow,matchingBlock,block_size,search_windows_size)

Mean_Square_Error   = zeros((search_windows_size - block_size+1), (search_windows_size - block_size+1));
for i = 1 : (search_windows_size - block_size+1)
    for j = 1 : (search_windows_size - block_size+1)
        temp_Matching_Block = searchingWindow(i : i+block_size-1, j : j+block_size-1);
        temp_Mean_Square_Error = (temp_Matching_Block - matchingBlock) .^ 2;
        Mean_Square_Error(i, j) = sum(sum(temp_Mean_Square_Error));
    end
end

end

