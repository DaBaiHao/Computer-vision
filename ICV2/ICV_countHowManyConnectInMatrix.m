function count = ICV_countHowManyConnectInMatrix(matrix)

[Rows,Cols] = size(matrix);
count = 0;
for i =1 : Rows
    
    for j = 1: Cols
        count = count+1;
        if matrix(i,j) == 255
            
        end
        
    end
end



end

