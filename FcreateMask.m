% Create Mask 
function [MASK] = FcreateMask(h, w, left_eye_points, right_eye_points, nose_points, mouth_points, blurFactor)

x = left_eye_points(1, :);
y = left_eye_points(2, :);
blur1 = blur(poly2mask(x,y,h,w), blurFactor);

x = right_eye_points(1, :);
y = right_eye_points(2, :);
blur2 = blur(poly2mask(x,y,h,w), blurFactor);

x = nose_points(1, :);
y = nose_points(2, :);
blur3 = blur(poly2mask(x,y,h,w), blurFactor);

x = mouth_points(1, :);
y = mouth_points(2, :);
blur4 = blur(poly2mask(x,y,h,w), blurFactor);

idx = find(blur3 > 0);
blur3(idx) = blur3(idx)+1;
idx = find(blur4 > 0);
blur4(idx) = blur4(idx)+2;

MASK = (blur1)+(blur2)+(blur3)+(blur4);

