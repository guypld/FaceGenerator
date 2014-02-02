function dataBase = getDifferentImages(images, boundry)

    [total, h, w] = size(images);
    
%     init return value
    dataBase = zeros(boundry, h, w);
    
%     init CLASSIFYR matric
    CLASSIFYR = zeros(total, (h*w));

%     add images to the CLASSIFYR
    for i=1 : total
        tmp = reshape(images(i, :, :), h, w);
        CLASSIFYR(i, :) = reshape(  tmp, 1, (h*w)  );
    end

%     classify
    IDX = kmeans(CLASSIFYR, boundry);
    
%     return represntative from each class
    for i = 1 : total
        dataBase(IDX( i ), :, :) = images( i, :, : );
    end

end