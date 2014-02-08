% create DB

% load all images

% loop all posibilities and run foo
% function big_image_list = foo(images_vec, points_vec, weight_vec, target)

IMAGE_DB1 = zeros(5, 192, 168);
IMAGE_DB2 = zeros(5, 192, 168);
IMAGE_DB3 = zeros(5, 192, 168);
IMAGE_DB4 = zeros(5, 192, 168);
IMAGE_DB5 = zeros(5, 192, 168);

PointCount = 39;

POINT_DB = zeros(5, 2, PointCount);   % 71 point number

% create DB
for i = 0:4
    disp(['Images\' num2str(i) '.pgm']);
    A = imread(['Images\' num2str(i) '.pgm'], 'pgm');
    IMAGE_DB(i+1, :, :) = A;
    
    load(['Points\' num2str(i) '.mat'],'Ox','Oy');

    POINT_DB(i+1, 1, :) = Ox';
    POINT_DB(i+1, 2, :) = Oy';
end

% wrap images
%%%%%%%%%  1  %%%%%%%%%%%%
Tx = reshape(POINT_DB(1, 1, :),1,PointCount);
Ty = reshape(POINT_DB(1, 2, :),1,PointCount);
for i = 0:4
    tmp = reshape(IMAGE_DB(i+1, :, :),192,168);
    Ox = reshape(POINT_DB(i+1, 1, :),1,PointCount);
    Oy = reshape(POINT_DB(i+1, 2, :),1,PointCount);
    IMAGE_DB1(i+1, :, :) = warpImage(tmp, Ox, Oy, Tx, Ty);
end
%%%%%%%%%  2  %%%%%%%%%%%%
Tx = reshape(POINT_DB(2, 1, :),1,PointCount);
Ty = reshape(POINT_DB(2, 2, :),1,PointCount);
for i = 0:4
    tmp = reshape(IMAGE_DB(i+1, :, :),192,168);
    Ox = reshape(POINT_DB(i+1, 1, :),1,PointCount);
    Oy = reshape(POINT_DB(i+1, 2, :),1,PointCount);
    IMAGE_DB2(i+1, :, :) = warpImage(tmp, Ox, Oy, Tx, Ty);
end
%%%%%%%%%  3  %%%%%%%%%%%%
Tx = reshape(POINT_DB(3, 1, :),1,PointCount);
Ty = reshape(POINT_DB(3, 2, :),1,PointCount);
for i = 0:4
    tmp = reshape(IMAGE_DB(i+1, :, :),192,168);
    Ox = reshape(POINT_DB(i+1, 1, :),1,PointCount);
    Oy = reshape(POINT_DB(i+1, 2, :),1,PointCount);
    IMAGE_DB3(i+1, :, :) = warpImage(tmp, Ox, Oy, Tx, Ty);
end
%%%%%%%%%  4  %%%%%%%%%%%%
Tx = reshape(POINT_DB(4, 1, :),1,PointCount);
Ty = reshape(POINT_DB(4, 2, :),1,PointCount);
for i = 0:4
    tmp = reshape(IMAGE_DB(i+1, :, :),192,168);
    Ox = reshape(POINT_DB(i+1, 1, :),1,PointCount);
    Oy = reshape(POINT_DB(i+1, 2, :),1,PointCount);
    IMAGE_DB4(i+1, :, :) = warpImage(tmp, Ox, Oy, Tx, Ty);
end
%%%%%%%%%  5  %%%%%%%%%%%%
Tx = reshape(POINT_DB(5, 1, :),1,PointCount);
Ty = reshape(POINT_DB(5, 2, :),1,PointCount);
for i = 0:4
    tmp = reshape(IMAGE_DB(i+1, :, :),192,168);
    Ox = reshape(POINT_DB(i+1, 1, :),1,PointCount);
    Oy = reshape(POINT_DB(i+1, 2, :),1,PointCount);
    IMAGE_DB5(i+1, :, :) = warpImage(tmp, Ox, Oy, Tx, Ty);
end


