


% D_LEFT_EYES
% D_RIGHT_EYES
% D_NOSES
% D_MOUTHS

eye_delta = 85;
nose_delta = 55;
mouth_delta = 65;

el = 5;
er = 15;
nos = 11;
mth = 4;

[count, h_eye1, w_eye1] = size( D_LEFT_EYES );
eye1 = reshape( D_LEFT_EYES(el, :, :), h_eye1, w_eye1);

[count, h_eye2, w_eye2] = size( D_RIGHT_EYES );
eye2 = reshape( D_RIGHT_EYES(er, :, :), h_eye2, w_eye2);

[count, h_nose, w_nose] = size( D_NOSES );
nose = reshape( D_NOSES(nos, :, :), h_nose, w_nose);

[count, h_mouth, w_mouth] = size( D_MOUTHS );
mouth = reshape( D_MOUTHS(mth, :, :), h_mouth, w_mouth);

image = eye1;
eye_hight_diff = round( (h_eye1/2) - (h_eye2/2) );
eye_width_diff = round( ( (w_eye1/2) - (w_eye2/2) ) + eye_delta );
range_h = ( eye_hight_diff : (eye_hight_diff + h_eye2) - 1 );
range_w = ( eye_width_diff : (eye_width_diff + w_eye2) - 1 );
% add the second eye
image(range_h, range_w) = eye2(:, :);

nose_hight_diff = round( ( (h_eye1/2) - (h_nose/2) ) + nose_delta );
nose_width_diff = round( ( (w_eye1/2) - (w_nose/2) ) + (eye_delta/2) );
range_h = ( nose_hight_diff : (nose_hight_diff + h_nose) - 1 );
range_w = ( nose_width_diff : (nose_width_diff + w_nose) - 1 );
% add the nose
image(range_h, range_w) = nose(:, :);

mouth_hight_diff = round( ( (h_eye1/2) - (h_mouth/2) ) + nose_delta + mouth_delta );
mouth_width_diff = round( ( (w_eye1/2) - (w_mouth/2) ) + (eye_delta/2) );
range_h = ( mouth_hight_diff : (mouth_hight_diff + h_mouth) - 1 );
range_w = ( mouth_width_diff : (mouth_width_diff + w_mouth) - 1 );
% add the mouth
image(range_h, range_w) = mouth(:, :);

showImage(image);













