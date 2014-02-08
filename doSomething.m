function image = doSomething(db, DBle, DBre, DBn, DBm, DBPle, DBPre, DBPn, DBPm, el, er, n, m, baseImage, blurFactor)

IMAGE_DB = db;
D_LEFT_EYES = DBle;
D_RIGHT_EYES = DBre;
D_NOSES = DBn;
D_MOUTHS = DBm;

D_LEFT_EYES_POINTS = DBPle;
D_RIGHT_EYES_POINTS = DBPre;
D_NOSES_POINTS = DBPn;
D_MOUTHS_POINTS = DBPm;

tmp = reshape(IMAGE_DB(1, :, :),192,168);

A = reshape(IMAGE_DB(baseImage, :, :), 192, 168);
srcImg(:, :, 1) = A;
srcImg(:, :, 2) = A;
srcImg(:, :, 3) = A;

%%%%%%%%%%%%D_LEFT_EYES_POINTS%%%%%%%%%%%%
[total, h, w] = size(D_LEFT_EYES);

A = reshape(D_LEFT_EYES(18, :, :), h, w);
clear tgImg;
tgImg(:, :, 1) = A;
tgImg(:, :, 2) = A;
tgImg(:, :, 3) = A;
x = round( reshape( D_LEFT_EYES_POINTS(el, 1, 1:8), 1, 8 ) );
y = round( reshape( D_LEFT_EYES_POINTS(el, 2, 1:8), 1, 8 ) );
minX = min(x);
minY = min(y);
x=x-minX;
y=y-minY;
x = [x(1), x(5), x(3), x(6), x(2), x(7), x(4), x(8)];
y = [y(1), y(5), y(3), y(6), y(2), y(7), y(4), y(8)];
mask = poly2mask(x,y,h,w);
blurMask = blur(mask, blurFactor);
for i = 1:h
    for j = 1:w
            tmp(i + minY,j + minX) = (A(i,j) * blurMask(i,j)) + (tmp(i + minY,j + minX) * (1 - blurMask(i,j)));
    end
end


%%%%%%%%%%%%%D_RIGHT_EYES_POINTS%%%%%%%%%%%
[total, h, w] = size(D_RIGHT_EYES);

A = reshape(D_RIGHT_EYES(18, :, :), h, w);
clear tgImg;
tgImg(:, :, 1) = A;
tgImg(:, :, 2) = A;
tgImg(:, :, 3) = A;
x = round( reshape( D_RIGHT_EYES_POINTS(er, 1, 9:16), 1, 8 ) );
y = round( reshape( D_RIGHT_EYES_POINTS(er, 2, 9:16), 1, 8 ) );
minX = min(x);
minY = min(y);
x=x-minX;
y=y-minY;
x = [x(1), x(5), x(3), x(6), x(2), x(7), x(4), x(8)];
y = [y(1), y(5), y(3), y(6), y(2), y(7), y(4), y(8)];
mask = poly2mask(x,y,h,w);
blurMask = blur(mask, blurFactor);
for i = 1:h
    for j = 1:w
            tmp(i + minY,j + minX) = (A(i,j) * blurMask(i,j)) + (tmp(i + minY,j + minX) * (1 - blurMask(i,j)));
    end
end

%%%%%%%%%%%%D_NOSES_POINTS%%%%%%%%%%%%
[total, h, w] = size(D_NOSES);

A = reshape(D_NOSES(18, :, :), h, w);
clear tgImg;
tgImg(:, :, 1) = A;
tgImg(:, :, 2) = A;
tgImg(:, :, 3) = A;
x = round( reshape( D_NOSES_POINTS(n, 1, 17:27), 1, 11 ) );
y = round( reshape( D_NOSES_POINTS(n, 2, 17:27), 1, 11 ) );
minX = min(x);
minY = min(y);
x=x-minX;
y=y-minY;
mask = poly2mask(x,y,h,w);
blurMask = blur(mask, blurFactor);
imshow(blurMask);
for i = 1:h
    for j = 1:w
            tmp(i + minY,j + minX) = (A(i,j) * blurMask(i,j)) + (tmp(i + minY,j + minX) * (1 - blurMask(i,j)));
    end
end

%%%%%%%%%%%D_MOUTHS_POINTS%%%%%%%%%%%%%
[total, h, w] = size(D_MOUTHS);

A = reshape(D_MOUTHS(18, :, :), h, w);
clear tgImg;
tgImg(:, :, 1) = A;
tgImg(:, :, 2) = A;
tgImg(:, :, 3) = A;
x = round( reshape( D_MOUTHS_POINTS(m, 1, 28:39), 1, 12 ) );
y = round( reshape( D_MOUTHS_POINTS(m, 2, 28:39), 1, 12 ) );
minX = min(x);
minY = min(y);
x=x-minX;
y=y-minY;
x = [x(1), x(6), x(12), x(4), x(10), x(8), x(2), x(7), x(9), x(3), x(11), x(5)];
y = [y(1), y(6), y(12), y(4), y(10), y(8), y(2), y(7), y(9), y(3), y(11), y(5)];
mask = poly2mask(x,y,h,w);
blurMask = blur(mask, blurFactor);
for i = 1:h
    for j = 1:w
            tmp(i + minY,j + minX) = (A(i,j) * blurMask(i,j)) + (tmp(i + minY,j + minX) * (1 - blurMask(i,j)));
    end
end

image = tmp;
