function after_filtered_image = ICV_filter2(img)
 
[Rows, Cols,slices] = size(img);
convolutionMatrix = [1,-1,1
                     1,5,1
                     1,-1,1];
                 
kernelA  =     [1,2,1
               2,4,2
                1,2,1]; 
            
%convolutionMatrix =        kernelA;   
 
kernelB  =     [0,1,0
                1,-4,1
                0,1,0]; 
            
convolutionMatrix =        kernelB;   
 
 
%new_Rows = Rows-2;
%new_Cols = Cols-2;
after_filtered_image = zeros(Rows,Cols, slices);
for i = 1 : Rows-2  
    for j = 1 : Cols-2
        row1 = double(img(i,j,:))*double(convolutionMatrix(1,1))     + double(img(i,j+1,:))*double(convolutionMatrix(1,2))+ double(img(i,j+2,:))*double(convolutionMatrix(1,3));
        row2 = double(img(i+1,j,:))*double(convolutionMatrix(2,1))   + double(img(i+1,j+1,:))*double(convolutionMatrix(2,2))+ double(img(i+1,j+2,:))*double(convolutionMatrix(2,3));
        row3 = double(img(i+2,j,:))*double(convolutionMatrix(3,1))   + double(img(i+2,j+1,:))*double(convolutionMatrix(3,2))+ double(img(i+2,j+2,:))*double(convolutionMatrix(3,3));
        
        average = round((row1+row2+row3)/9);
        after_filtered_image(i+1,j+1,:) = average;
    end
end
after_filtered_image = uint8(after_filtered_image);
 
end
