function after_Rotated_img = ICV_Rot(img,angle)
%ICV_ROT forward mapping function
%   

% img conversion
[Rows, Cols,slices] = size(img);

after_Rotated_img = uint8(zeros(round(abs(cosd(angle)) * Rows + Cols * abs(sind(angle))) ,round(abs(cosd(angle)) * Cols + Rows * abs(sind(angle))),3));

[Rows_new, Cols_new,slices] = size(after_Rotated_img);



for i = 1 : Rows_new  
    for j = 1 : Cols_new
        
        x = round(uint32((i - Rows_new/2) * cosd(angle) -(j - Cols_new/2) * sind(angle) + Rows/2));
        y = round(uint32((j - Cols_new/2) * cosd(angle) +(i - Rows_new/2) * sind(angle) + Cols/2));
        
        if((x >= 1) && (y>=1) && (x<=Rows) && ( y <= Cols))
            after_Rotated_img(i,j,:) = img(x,y,:);
        end
    end
end

