function his = ICV_hisgram(img,total_number, currentNumber)


 


 

 

[Rows, Cols] = size(img);

 

 % double_img = double(img);

 

his = zeros(1,255);



 
count = 1;
for x = 1:255

    % outputArg1(x) = 0;

    for i = 1:Rows

        for j = 1:Cols

            if(img(i,j) == x)

                his(x) = his(x)+1;
                count = count +1;
            end

            

           
            

        end

    end
    

end

for i = 1:255
    number(i) = his(i)/count;
end

his = number;

subplot(total_number,1,currentNumber);
bar(his, 'r'); 

norm_img = normalize(his, 'norm', 1);




xlabel('gray level');
ylabel('Number of pixels');
title('gray histogram');
hold on
plot(norm_img, 'b');





end

 

