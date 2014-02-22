points_count = 39;
warp_index = 1;
hieght = 192;
width = 168;
% function [DB, pDB] = FcreateDb(image_count, h, w, points_count, warp_index)
% [DB, pDB] = FcreateDb(10, hieght, width, points_count, warp_index);

% function [MASK] = FcreateMask(h, w, left_eye_points, right_eye_points, nose_points, mouth_points, blurFactor)
x = reshape(pDB(warp_index,1,:), 1, points_count);
y = reshape(pDB(warp_index,2,:), 1, points_count);
x1 = [x(1), x(5), x(3), x(6), x(2), x(7), x(4), x(8)];
y1 = [y(1), y(5), y(3), y(6), y(2), y(7), y(4), y(8)];
x2 = [x(9), x(13), x(11), x(14), x(10), x(15), x(12), x(16)];
y2 = [y(9), y(13), y(11), y(14), y(10), y(15), y(12), y(16)];
x3 = x(17:27);
y3 = y(17:27);
x4 = [x(28), x(33), x(39), x(31), x(37), x(35), x(29), x(34), x(36), x(30), x(38), x(32)];
y4 = [y(28), y(33), y(39), y(31), y(37), y(35), y(29), y(34), y(36), y(30), y(38), y(32)];
% mask = FcreateMask(192, 168, [x1 ; y1], [x2 ; y2], [x3 ; y3], [x4 ; y4], 0.1);
% showImage(mask*255);
% function [IMAGE] = FgenImage(db, mask, patch, overlap, base, eyes, nose, mouth)
image = FgenImage(DB, mask, 5, 2, [1], [6], [1], [1]);
showImage(image);
image = FgenImage(DB, mask, 6, 2, [1], [1], [1], [1]);
% showImage(image);

