function count = ICV_countHowManyConnectInMatrix(matrix)

[Rows,Cols] = size(matrix);
count = 0;
for i =1 : Rows
    
    for j = 1: Cols
        
        if matrix(i,j) == 255
            count = count+1;
            matrix = ICV_findConnect(matrix,i,j,count);
        end
        
    end
end



end

