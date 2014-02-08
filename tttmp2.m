



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

eye_delta = 95;
nose_delta = 35;
mouth_delta = 75;

min_pad_x = round( min(min(D_LEFT_EYES_POINTS(:, 1, :))) );
min_pad_y = round( min(min(D_LEFT_EYES_POINTS(:, 2, :))) );

el = 5;
er = 15;
nos = 8;
mth = 4;



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

range_h = 1 : (h_eye1 );
range_w = 1 : (w_eye1);
image(range_h, range_w) = eye1(:, :);


pad_x = round( min(D_LEFT_EYES_POINTS(el, 1, 1:8)) );
pad_y = round( min(D_LEFT_EYES_POINTS(el, 2, 1:8)) );
points(1, 1:8) = D_LEFT_EYES_POINTS(el, 1, 1:8) - pad_x;
points(2, 1:8) = D_LEFT_EYES_POINTS(el, 2, 1:8) - pad_y;

eye_hight_diff = round( (h_eye1/2) - (h_eye2/2) );
eye_width_diff = round( ( (w_eye1/2) - (w_eye2/2) ) + eye_delta );
range_h = ( eye_hight_diff : (eye_hight_diff + h_eye2) - 1 );
range_w = ( eye_width_diff : (eye_width_diff + w_eye2) - 1 );
% add the second eye
image(range_h, range_w) = eye2(:, :);

pad_x = round( min(D_RIGHT_EYES_POINTS(er, 1, 9:16)) );
pad_y = round( min(D_RIGHT_EYES_POINTS(er, 2, 9:16)) );
points(1, 9:16) = D_RIGHT_EYES_POINTS(er, 1, 9:16) - pad_x + eye_width_diff;
points(2, 9:16) = D_RIGHT_EYES_POINTS(er, 2, 9:16) - pad_y + eye_hight_diff;

nose_hight_diff = round( ( (h_eye1/2) - (h_nose/2) ) + nose_delta );
nose_width_diff = round( ( (w_eye1/2) - (w_nose/2) ) + (eye_delta/2) );
range_h = ( nose_hight_diff : (nose_hight_diff + h_nose) - 1 );
range_w = ( nose_width_diff : (nose_width_diff + w_nose) - 1 );
% add the nose
image(range_h, range_w) = nose(:, :);

pad_x = round( min(D_NOSES_POINTS(nos, 1, 17:27)) );
pad_y = round( min(D_NOSES_POINTS(nos, 2, 17:27)) );
points(1, 17:27) = D_NOSES_POINTS(nos, 1, 17:27) - pad_x + nose_width_diff;
points(2, 17:27) = D_NOSES_POINTS(nos, 2, 17:27) - pad_y + nose_hight_diff;

mouth_hight_diff = round( ( (h_eye1/2) - (h_mouth/2) ) + nose_delta + mouth_delta );
mouth_width_diff = round( ( (w_eye1/2) - (w_mouth/2) ) + (eye_delta/2) );
range_h = ( mouth_hight_diff : (mouth_hight_diff + h_mouth) - 1 );
range_w = ( mouth_width_diff : (mouth_width_diff + w_mouth) - 1 );
% add the mouth
image(range_h, range_w) = mouth(:, :);

pad_x = round( min(D_MOUTHS_POINTS(mth, 1, 28:39)) );
pad_y = round( min(D_MOUTHS_POINTS(mth, 2, 28:39)) );
points(1, 28:39) = D_MOUTHS_POINTS(mth, 1, 28:39) - pad_x + mouth_width_diff;
points(2, 28:39) = D_MOUTHS_POINTS(mth, 2, 28:39) - pad_y + mouth_hight_diff;

x = reshape((POINT_DB(1, 1, :)), 1, 39);
y = reshape((POINT_DB(1, 2, :)), 1, 39);

padX = 20;
padY = 20;
points(1, :) = points(1, :) + padX;
points(2, :) = points(2, :) + padY;
[h, w] = size(image);
image_tmp( padX:(padX+h-1), padY:(padY+w-1) ) = image(:, :);
image = image_tmp;
showImage(image);

tmp = reshape(IMAGE_DB(1, :, :),192,168);
showImage(tmp);
semi_final = warpImage(tmp, x, y, points(1, :), points(2, :));
showImage(semi_final);

for i = 1 : 192
    for j = 1 : 168
        if i<=padX || j<=padY
            final(i,j) = image(i,j);
        end
        if(image(i,j) == 0)
            final(i,j) = semi_final(i,j);
        else
            final(i,j) = image(i,j);
        end
    end
end

showImage(final);










