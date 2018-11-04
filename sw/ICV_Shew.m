function after_Shew_img = ICV_Shew(img,angle_Conversion)
%ICV_Shew Inverse mapping
%   
 
[Rows, Cols, slices] = size(img);
 
 
after_Shew_img = uint8(zeros(Rows ,round(Cols+Rows*tand(angle_Conversion)),3));
 
 
 
for i = 1 : Rows  
    for j = 1 : Cols
        
        y =round(i);
        x = round(j- i * tand(angle_Conversion) + Rows*tand(angle_Conversion));
        
        
       
       
        after_Shew_img(y,x,:) = img(i,j,:);
       
    end
end