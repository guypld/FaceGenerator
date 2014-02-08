function [dataBase, dataPoints] = getDifferentImages(images, points, boundry)

    [total, h, w] = size(images);
    [total_p, h_p, w_p] = size(points);
    
%     init return value
    dataBase = zeros(boundry, h, w);
    dataPoints = zeros(boundry, h_p, w_p);
    
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
        dataPoints(IDX( i ), :, :) = points( i, :, : );
    end

end