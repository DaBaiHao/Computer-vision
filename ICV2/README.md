# ICV 2

## 1

- Block size of 16x16 pixels.

  ```matlab

  inputBlock = ones(16,16);
  ```

- Search window of 20x20 pixels.

## 2

Read the video and get all frames

```matlab
% read the video

obj = VideoReader(video_path);
obj_numberofframe = obj.NumberOfFrame;

%
for i = 1:obj_numberofframe -1
% this frame and next frame
frame_1 = read(obj,i);
frame_2 = read(obj,i+1);

end
```

To compare two frame difference, the function using a **for** loop, and compare each frame difference using **if** statement:

```matlab
for m = 1:Rows
        for n = 1:Cols
                  % if frame 1 not equals to frame 2, block will equals to white
                  if(frame_1(m,n) ~= frame_2(m,n) )
                          new_img(m,n) = 255;
                  else
                        % if the same the image will black
                          new_img(m,n) = 0;
                  end
        end
end
```

Because of the generated pixels have many noises in the background, add classification threshold into the **if** statement, if the difference number smaller than the classification threshold, the function will think the difference as noises :

```matlab
if(frame_1(m,n) ~= frame_2(m,n) && abs(frame_2(m,n)- frame_1(m,n)) > classification_threshold   )

end
```
