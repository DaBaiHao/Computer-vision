function matrix = ICV_findConnect(matrix,i,j,count)

[Rows,Cols] = size(matrix);
matrix(i,j) = count;
if i ~= Rows
    if matrix(i+1,j) == 255
        matrix = ICV_findConnect(matrix,i+1,j,count);
    end
end
if j ~= Cols
    if matrix(i,j+1) == 255
        matrix = ICV_findConnect(matrix,i,j+1,count);
    end
end
if i ~= 1
    if matrix(i-1,j) == 255
        matrix = ICV_findConnect(matrix,i-1,j,count);
    end
end
if j ~= 1
    if matrix(i,j-1) == 255
        matrix = ICV_findConnect(matrix,i,j-1,count);
    end
end

end

