function intersection= ICV_intersection(hisgram1,hisgram2)
%ICV_INTERCTITION this function is to compare two hisgram and 
 
 
intersection = zeros(1,255);
for i = 1:255
    if(hisgram1(i) == hisgram2(i))
        intersection(i) = hisgram1(i);
    end
end
 
 
 
end