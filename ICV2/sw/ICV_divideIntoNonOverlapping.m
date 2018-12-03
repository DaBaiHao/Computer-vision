function imgs = ICV_divideIntoNonOverlapping(img, divide_size)

[Rows, Cols] = size(img);
% if the size of the img can not cut to equally sized cut it 
if (mod(Rows,divide_size) ~= 0)
    for i = 1: mod(Rows,divide_size)
        img(i,:) = [];
    end
end

if (mod(Cols,divide_size) ~= 0)
    for i = 1: mod(Cols,divide_size)
        img(:,i) = [];
    end
end

block_i = 1;
for i = 1:divide_size:Rows
    for j = 1:divide_size:Cols
        
        imgs(:,:,block_i) = img(i: i+divide_size-1, j: j+divide_size-1);
        
        block_i = block_i+ 1;
    end
    
end






end

