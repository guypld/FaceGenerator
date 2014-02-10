



% 
%     if( strcmp(feature, left_eye) )
%         pointsVector = 1 : 8;
%     elseif( strcmp(feature, right_eye) )
%         pointsVector = 9 : 16;
%     elseif( strcmp(feature, nose) )
%         pointsVector = 17 : 27;
%     elseif( strcmp(feature, mouth) )
%         pointsVector = 28 : 39;
%     end


% D_LEFT_EYES
% D_RIGHT_EYES
% D_NOSES
% D_MOUTHS

% D_LEFT_EYES_POINTS
% D_RIGHT_EYES_POINTS
% D_NOSES_POINTS
% D_MOUTHS_POINTS

min_pad_x = round( min(min(D_LEFT_EYES_POINTS(:, 1, :))) );
min_pad_y = round( min(min(D_LEFT_EYES_POINTS(:, 2, :))) );

baseFace = 3;

tmp = reshape(IMAGE_DB(baseFace, :, :),192,168);

el = 8;
er = 8;
nos = 18;
mth = 8;

padX = 20;
padY = 35;
blurFactor = 0.1;

eye_delta = 85;
nose_delta = 45;
mouth_delta = 65;

clear image1;
clear image2;
clear image3;
clear image4;
clear image;

%%%%%%%%%%%%%%%%%%%%%%%%

clear image;
image = zeros(192, 168);
[count, h_eye1, w_eye1] = size( D_LEFT_EYES );
eye1 = reshape( D_LEFT_EYES(el, :, :), h_eye1, w_eye1);

[count, h_eye2, w_eye2] = size( D_RIGHT_EYES );
eye2 = reshape( D_RIGHT_EYES(er, :, :), h_eye2, w_eye2);

[count, h_nose, w_nose] = size( D_NOSES );
nose = reshape( D_NOSES(nos, :, :), h_nose, w_nose);

[count, h_mouth, w_mouth] = size( D_MOUTHS );
mouth = reshape( D_MOUTHS(mth, :, :), h_mouth, w_mouth);

range_h = 1 : (h_eye1);
range_w = 1 : (w_eye1);
image1(range_h, range_w) = eye1(:, :);
pad_x = round( min(D_LEFT_EYES_POINTS(el, 1, 1:8)) );
pad_y = round( min(D_LEFT_EYES_POINTS(el, 2, 1:8)) );
points(1, 1:8) = D_LEFT_EYES_POINTS(el, 1, 1:8) - pad_x;
points(2, 1:8) = D_LEFT_EYES_POINTS(el, 2, 1:8) - pad_y;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
eye_hight_diff = round( (h_eye1/2) - (h_eye2/2) );
eye_width_diff = round( ( (w_eye1/2) - (w_eye2/2) ) + eye_delta );
range_h = ( eye_hight_diff : (eye_hight_diff + h_eye2) - 1 );
range_w = ( eye_width_diff : (eye_width_diff + w_eye2) - 1 );
% add the second eye
image2(range_h, range_w) = eye2(:, :);
pad_x = round( min(D_RIGHT_EYES_POINTS(er, 1, 9:16)) );
pad_y = round( min(D_RIGHT_EYES_POINTS(er, 2, 9:16)) );
points(1, 9:16) = D_RIGHT_EYES_POINTS(er, 1, 9:16) - pad_x + eye_width_diff;
points(2, 9:16) = D_RIGHT_EYES_POINTS(er, 2, 9:16) - pad_y + eye_hight_diff;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nose_hight_diff = round( ( (h_eye1/2) - (h_nose/2) ) + nose_delta );
nose_width_diff = round( ( (w_eye1/2) - (w_nose/2) ) + (eye_delta/2) );
range_h = ( nose_hight_diff : (nose_hight_diff + h_nose) - 1 );
range_w = ( nose_width_diff : (nose_width_diff + w_nose) - 1 );
% add the nose
image3(range_h, range_w) = nose(:, :);
pad_x = round( min(D_NOSES_POINTS(nos, 1, 17:27)) );
pad_y = round( min(D_NOSES_POINTS(nos, 2, 17:27)) );
points(1, 17:27) = D_NOSES_POINTS(nos, 1, 17:27) - pad_x + nose_width_diff;
points(2, 17:27) = D_NOSES_POINTS(nos, 2, 17:27) - pad_y + nose_hight_diff;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mouth_hight_diff = round( ( (h_eye1/2) - (h_mouth/2) ) + nose_delta + mouth_delta );
mouth_width_diff = round( ( (w_eye1/2) - (w_mouth/2) ) + (eye_delta/2) );
range_h = ( mouth_hight_diff : (mouth_hight_diff + h_mouth) - 1 );
range_w = ( mouth_width_diff : (mouth_width_diff + w_mouth) - 1 );
% add the mouth
image4(range_h, range_w) = mouth(:, :);
pad_x = round( min(D_MOUTHS_POINTS(mth, 1, 28:39)) );
pad_y = round( min(D_MOUTHS_POINTS(mth, 2, 28:39)) );
points(1, 28:39) = D_MOUTHS_POINTS(mth, 1, 28:39) - pad_x + mouth_width_diff;
points(2, 28:39) = D_MOUTHS_POINTS(mth, 2, 28:39) - pad_y + mouth_hight_diff;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[hh,ww] = size(tmp);

points(1, :) = points(1, :) + padX;
points(2, :) = points(2, :) + padY;

[h, w] = size(image1);
image_tmp = zeros(size(tmp));
image_tmp( padY:(padY+h-1), padX:(padX+w-1) ) = image1(:, :);
image1 = image_tmp;
x = round(points(1, 1:8));
y = round(points(2, 1:8));
x = [x(1), x(5), x(3), x(6), x(2), x(7), x(4), x(8)];
y = [y(1), y(5), y(3), y(6), y(2), y(7), y(4), y(8)];
mask = poly2mask(x,y,hh,ww);
blur1 = blur(mask, blurFactor);
clear image_tmp;

[h, w] = size(image2);
image_tmp = zeros(size(tmp));
image_tmp( padY:(padY+h-1), padX:(padX+w-1) ) = image2(:, :);
image2 = image_tmp;
x = round(points(1, 9:16));
y = round(points(2, 9:16));
x = [x(1), x(5), x(3), x(6), x(2), x(7), x(4), x(8)];
y = [y(1), y(5), y(3), y(6), y(2), y(7), y(4), y(8)];
mask = poly2mask(x,y,hh,ww);
blur2 = blur(mask, blurFactor);
clear image_tmp;

[h, w] = size(image3);
image_tmp = zeros(size(tmp));
image_tmp( padY:(padY+h-1), padX:(padX+w-1) ) = image3(:, :);
image3 = image_tmp;
x = round(points(1, 17:27));
y = round(points(2, 17:27));
% x = [x(1), x(5), x(3), x(6), x(2), x(7), x(4), x(8)];
% y = [y(1), y(5), y(3), y(6), y(2), y(7), y(4), y(8)];
mask = poly2mask(x,y,hh,ww);
blur3 = blur(mask, blurFactor/2);
% showImage(blur3*255)s
clear image_tmp;

[h, w] = size(image4);
image_tmp = zeros(size(tmp));
image_tmp( padY:(padY+h-1), padX:(padX+w-1) ) = image4(:, :);
image4 = image_tmp;
x = round(points(1, 28:39));
y = round(points(2, 28:39));
x = [x(1), x(6), x(12), x(4), x(10), x(8), x(2), x(7), x(9), x(3), x(11), x(5)];
y = [y(1), y(6), y(12), y(4), y(10), y(8), y(2), y(7), y(9), y(3), y(11), y(5)];
mask = poly2mask(x,y,hh,ww);
blur4 = blur(mask, blurFactor);
clear image_tmp;


x = reshape((POINT_DB(baseFace, 1, :)), 1, 39);
y = reshape((POINT_DB(baseFace, 2, :)), 1, 39);
tx = round(points(1, :));
ty = round(points(2, :));
semi_final = warpImage(tmp, x, y, tx, ty);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55

% tx = reshape((POINT_DB(baseFace, 1, :)), 1, 39);
% ty = reshape((POINT_DB(baseFace, 2, :)), 1, 39);

% imshow(tmp);
% hold on;
% for xx = 1 : 39
%     plot(tx(xx),ty(xx),'r.','MarkerSize',10);
%     t(1) = text(tx(xx),ty(xx),num2str(xx));
%     set(t(:),'fontw','bold','fonts',10)
% end
% 
% showImage(image1);

showImage( (blur1+blur2+blur3+blur4) *255 );
% showImage( (image1+image2+image3+image4) );

for i = 1 : 192
    for j = 1 : 168
        final1(i,j) = (image1(i,j) * blur1(i,j)) + (semi_final(i,j) * (1-blur1(i,j))) ;
    end
end
for i = 1 : 192
    for j = 1 : 168
        final2(i,j) = (image2(i,j) * blur2(i,j)) + (final1(i,j) * (1-blur2(i,j))) ;
    end
end
for i = 1 : 192
    for j = 1 : 168
        final3(i,j) = (image3(i,j) * blur3(i,j)) + (final2(i,j) * (1-blur3(i,j))) ;
    end
end
for i = 1 : 192
    for j = 1 : 168
        final4(i,j) = (image4(i,j) * blur4(i,j)) + (final3(i,j) * (1-blur4(i,j))) ;
    end
end

showImage(final4);










