function intersection= ICV_join(hisgram1,hisgram2)
%ICV_join this function is to calculate intersection of a pair of histograms
 
 
intersection = zeros(1,255);
for i = 1:255
    if(hisgram1(i) > hisgram2(i))
        intersection(i) = hisgram1(i);
    else
        intersection(i) = hisgram2(i);
    end
end
 
 
 
end