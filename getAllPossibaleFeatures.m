function [dataBase, points] = getAllPossibaleFeatures(images, feature, count, patchSize)

    pointsVector = 0;
    left_eye = 'left_eye';
    right_eye = 'right_eye';
    nose = 'nose';
    mouth = 'mouth';
    if( strcmp(feature, left_eye) )
        pointsVector = 1 : 8;
    elseif( strcmp(feature, right_eye) )
        pointsVector = 9 : 16;
    elseif( strcmp(feature, nose) )
        pointsVector = 17 : 27;
    elseif( strcmp(feature, mouth) )
        pointsVector = 28 : 39;
    end
    [total, h, w] = size(images);
    
%     calc best boundry box for the feature
    x1 = zeros(1, count);
    y1 = zeros(1, count);
    x2 = zeros(1, count);
    y2 = zeros(1, count);
    for i = 0 : count-1
        load(['Points\' num2str(i) '.mat'],'Ox','Oy');
        Ox = round(Ox);
        Oy = round(Oy);
        
        x1(i+1) = min(Ox(pointsVector));
        y1(i+1) = min(Oy(pointsVector));
        x2(i+1) = max(Ox(pointsVector));
        y2(i+1) = max(Oy(pointsVector));
    end

    x1 = min(x1);
    y1 = min(y1);
    x2 = max(x2);
    y2 = max(y2);
    
    picPerDb = total / count;
    
    for i = 1 : count
        disp( ['started working on ' feature '_DB_' num2str(i)] );
        range = (((i-1)*picPerDb)+1) : ((i)*picPerDb);
        subImage = randomSubImage( images( range, :, : ), patchSize, picPerDb, [y2, x2], [y1, x1]);
        subImage = subImage(:, y1 : y2, x1 : x2);
        sizeSubImage = size(subImage);
        
        range = (((i-1)*sizeSubImage(1))+1) : ((((i-1)*sizeSubImage(1))+1) + sizeSubImage(1) - 1);
        dataBase( range, :, : ) = subImage;
        
        load(['Points\' num2str(i-1) '.mat'],'Ox','Oy');
        for j = range
            points( j , 1, 1:39) = Ox;
            points( j , 2, 1:39) = Oy;
        end
    end

end