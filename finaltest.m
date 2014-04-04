points_count = 39;
warp_index = 1;
hieght = 192;
width = 168;
% function [DB, pDB] = FcreateDb(image_count, h, w, points_count, warp_index)
[DB1, pDB1] = FcreateDb(10, hieght, width, points_count, warp_index);
[DB2, pDB2] = FcreateDb(10, hieght, width, points_count, warp_index);
[DB3, pDB3] = FcreateDb(10, hieght, width, points_count, warp_index);
[DB4, pDB4] = FcreateDb(10, hieght, width, points_count, warp_index);
[DB5, pDB5] = FcreateDb(10, hieght, width, points_count, warp_index);
[DB6, pDB6] = FcreateDb(10, hieght, width, points_count, warp_index);
[DB7, pDB7] = FcreateDb(10, hieght, width, points_count, warp_index);
[DB8, pDB8] = FcreateDb(10, hieght, width, points_count, warp_index);
[DB9, pDB9] = FcreateDb(10, hieght, width, points_count, warp_index);
[DB10, pDB10] = FcreateDb(10, hieght, width, points_count, warp_index);


% function [MASK] = FcreateMask(h, w, left_eye_points, right_eye_points, nose_points, mouth_points, blurFactor)
mask1 = FcreateMask(hieght, width, pDB1, warp_index, points_count, 0.1);
mask2 = FcreateMask(hieght, width, pDB2, warp_index, points_count, 0.1);
mask3 = FcreateMask(hieght, width, pDB3, warp_index, points_count, 0.1);
mask4 = FcreateMask(hieght, width, pDB4, warp_index, points_count, 0.1);
mask5 = FcreateMask(hieght, width, pDB5, warp_index, points_count, 0.1);
mask6 = FcreateMask(hieght, width, pDB6, warp_index, points_count, 0.1);
mask7 = FcreateMask(hieght, width, pDB7, warp_index, points_count, 0.1);
mask8 = FcreateMask(hieght, width, pDB8, warp_index, points_count, 0.1);
mask9 = FcreateMask(hieght, width, pDB9, warp_index, points_count, 0.1);
mask10 = FcreateMask(hieght, width, pDB10, warp_index, points_count, 0.1);

break
% function FmakeIt(db, mask, out_count, b, e, n, m)
out_count = 3;
b = 3;
e = 4;
n = 5;
m = 3;
FmakeIt(DB1, mask1, out_count, b, e, n, m);
FmakeIt(DB2, mask2, out_count, b, e, n, m);
FmakeIt(DB3, mask3, out_count, b, e, n, m);
FmakeIt(DB4, mask4, out_count, b, e, n, m);
FmakeIt(DB5, mask5, out_count, b, e, n, m);
FmakeIt(DB6, mask6, out_count, b, e, n, m);
FmakeIt(DB7, mask7, out_count, b, e, n, m);
FmakeIt(DB8, mask8, out_count, b, e, n, m);
FmakeIt(DB9, mask9, out_count, b, e, n, m);
FmakeIt(DB10, mask10, out_count, b, e, n, m);


% for i = 1:25
%     p = randperm(10);
%     base = p(1:3)
%     p = randperm(10);
%     eyes = p(1:4)
%     p = randperm(10);
%     nose = p(1:5)
%     p = randperm(10);
%     mouth = p(1:3)
%     out = FgenImage(DB, mask, 3, 1, base, eyes, nose, mouth); 
%     out = filter2(fspecial('average',2),out);
%     out = filter2(fspecial('average',2),out);
%     showImage(out);
% end



