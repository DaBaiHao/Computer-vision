function after_filtered_image = ICV_filter55(img)
 
[Rows, Cols,slices] = size(img);
convolutionMatrix = [1,1,1,1,1
                     1,1,1,1,1
                     1,1,1,1,1
                     1,1,1,1,1
                     1,1,1,1,1];
                 
kernelA  =     [1,1,2,1,1
                1,2,3,2,1
                2,3,4,3,2
                1,2,3,2,1
                1,1,2,1,1];
            
%convolutionMatrix =        kernelA;   
 
kernelB  =     [0,1,0
                1,-4,1
                0,1,0]; 
            
convolutionMatrix =        kernelA;   
 
 
%new_Rows = Rows-2;
%new_Cols = Cols-2;
after_filtered_image = zeros(Rows,Cols, slices);
for i = 1 : Rows-4  
    for j = 1 : Cols-4
        row1 = double(img(i,j,:))*double(convolutionMatrix(1,1))     + double(img(i,j+1,:))*double(convolutionMatrix(1,2))+ double(img(i,j+2,:))*double(convolutionMatrix(1,3))+ double(img(i,j+3,:))*double(convolutionMatrix(1,4))+ double(img(i,j+4,:))*double(convolutionMatrix(1,5));
        row2 = double(img(i+1,j,:))*double(convolutionMatrix(2,1))   + double(img(i+1,j+1,:))*double(convolutionMatrix(2,2))+ double(img(i+1,j+2,:))*double(convolutionMatrix(2,3))+ double(img(i+1,j+3,:))*double(convolutionMatrix(2,4))+ double(img(i+1,j+4,:))*double(convolutionMatrix(2,5));
        row3 = double(img(i+2,j,:))*double(convolutionMatrix(3,1))   + double(img(i+2,j+1,:))*double(convolutionMatrix(3,2))+ double(img(i+2,j+2,:))*double(convolutionMatrix(3,3))+ double(img(i+2,j+3,:))*double(convolutionMatrix(3,4))+ double(img(i+2,j+4,:))*double(convolutionMatrix(3,5));
        row4 = double(img(i+3,j,:))*double(convolutionMatrix(4,1))   + double(img(i+3,j+1,:))*double(convolutionMatrix(4,2))+ double(img(i+3,j+2,:))*double(convolutionMatrix(4,3))+ double(img(i+3,j+3,:))*double(convolutionMatrix(4,4))+ double(img(i+3,j+4,:))*double(convolutionMatrix(4,5));
        row5 = double(img(i+4,j,:))*double(convolutionMatrix(5,1))   + double(img(i+4,j+1,:))*double(convolutionMatrix(5,2))+ double(img(i+4,j+2,:))*double(convolutionMatrix(5,3))+ double(img(i+4,j+3,:))*double(convolutionMatrix(5,4))+ double(img(i+4,j+4,:))*double(convolutionMatrix(5,5));
        
        average = round((row1+row2+row3+row4+row5)/25);
        after_filtered_image(i+2,j+2,:) = average;
    end
end
after_filtered_image = uint8(after_filtered_image);
 
end
