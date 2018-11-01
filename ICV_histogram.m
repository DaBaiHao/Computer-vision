function ICV_histogram(img)

%ICV_HISGRAM ????????????????????????

%   ?????????¨º?????¡Â

 

img_red = double(img(:,:,1));

img_green =double( img(:,:,2));

img_blue = double(img(:,:,3));

 

 

[Rows, Cols,slices] = size(img);

 

 % double_img = double(img);

 

red_his = zeros(1,255);

green_his = zeros(1,255);

blue_his = zeros(1,255);

 

for x = 1:255

    % outputArg1(x) = 0;

    for i = 1:Rows

        for j = 1:Cols

            if(img_red(i,j) == x)

                red_his(x) = red_his(x)+1;

            end

            

            if(img_green(i,j) == x)

                green_his(x) = green_his(x) + 1;

            end

            

            if(img_blue(i,j) == x)

                blue_his(x) = blue_his(x) + 1;

            end

            

        end

    end

end

%outputArg1 = img;

 

% x = 1:255;

subplot(3,1,1);

bar(red_his, 'r');

xlabel('red ');

title('sssss');

 

subplot(3,1,2);

bar(green_his, 'g');

xlabel('green ');

title('sssss');

 

subplot(3,1,3);

bar(blue_his, 'b');

xlabel('blue ');

title('sssss');

 

% outputArg2 = inputArg2;

end

 

