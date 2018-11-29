function his = ICV_hisgram(img,total_number, currentNumber)


 


 

 

[Rows, Cols] = size(img);

 

 % double_img = double(img);

 

his = zeros(1,255);



 

for x = 1:255

    % outputArg1(x) = 0;

    for i = 1:Rows

        for j = 1:Cols

            if(img(i,j) == x)

                his(x) = his(x)+1;

            end

            

           
            

        end

    end

end

subplot(total_number,1,currentNumber);
bar(his, 'r');
xlabel('gray level');
ylabel('Number of pixels');
title('gray histogram');

 



end

 

