
% load('myPoint\target.mat','Tx','Ty');
load('newPoints\0.mat','Ox','Oy');

Ox = round(Ox);
Oy = round(Oy);

ELMax_x = max(Ox(1:4));
ELMax_y = max(Oy(1:4));
ELMin_x = min(Ox(1:4));
ELMin_y = min(Oy(1:4));

ERMax_x = max(Ox(9:12));
ERMax_y = max(Oy(9:12));
ERMin_x = min(Ox(9:12));
ERMin_y = min(Oy(9:12));

NMax_x = max(Ox(17:27));
NMax_y = max(Oy(17:27));
NMin_x = min(Ox(17:27));
NMin_y = min(Oy(17:27));

MMax_x = max(Ox(50:59));
MMax_y = max(Oy(50:59));
MMin_x = min(Ox(50:59));
MMin_y = min(Oy(50:59));

LeftMax_x = max(Ox(60:64));
LeftMax_y = max(Oy(60:64));
LeftMin_x = min(Ox(60:64));
LeftMin_y = min(Oy(60:64));

RightMax_x = max(Ox(65:69));
RightMax_y = max(Oy(65:69));
RightMin_x = min(Ox(65:69));
RightMin_y = min(Oy(65:69));

disp('start eye_left_db');
eye_left_db = randomSubImage( IMAGE_DB, 5, 5, [ELMax_y, ELMax_x], [ELMin_y, ELMin_x]);
disp('start eye_right_db');
eye_right_db = randomSubImage( IMAGE_DB, 5, 5, [ERMax_y, ERMax_x], [ERMin_y, ERMin_x]);
disp('start nose_db');
nose_db = randomSubImage( IMAGE_DB, 5, 5, [NMax_y, NMax_x], [NMin_y, NMin_x]);
disp('start mouth_db');
mouth_db = randomSubImage( IMAGE_DB, 5, 5, [MMax_y, MMax_x], [MMin_y, MMin_x]);
disp('start left_db');
left_db = randomSubImage( IMAGE_DB, 5, 5, [LeftMax_y, LeftMax_x], [LeftMin_y, LeftMin_x]);
disp('start right_db');
right_db = randomSubImage( IMAGE_DB, 5, 5, [RightMax_y, RightMax_x], [RightMin_y, RightMin_x]);

% for i = 1:26
%     showImage(reshape(eye_left_db(i, :, :), 192, 168));
%     showImage(reshape(eye_right_db(i, :, :), 192, 168));
%     showImage(reshape(nose_db(i, :, :), 192, 168));
%     showImage(reshape(mouth_db(i, :, :), 192, 168));
%     showImage(reshape(left_db(i, :, :), 192, 168));
%     showImage(reshape(right_db(i, :, :), 192, 168));
% end

nCk = nchoosek(1:26,4);
nCk = nchoosek(26,4)

out = -1 * ones(192,168);

eyes = 8;
mouth = 15;
nose = 22;
cheaks = 2;

b = (out < 0);
if any(b)
    a1 = reshape(eye_left_db(eyes, :, :), 192, 168);
    a2 = reshape(eye_right_db(eyes, :, :), 192, 168);
    a3 = reshape(mouth_db(mouth, :, :), 192, 168);
    out(b) = a1(b) + a2(b) + a3(b);
end

b = (out < 0);
if any(b)
    a1 = reshape(nose_db(nose, :, :), 192, 168);
    out(b) = out(b) + a1(b);
end

b = (out < 0);
if any(b)
    a1 = reshape(left_db(cheaks, :, :), 192, 168);
    a2 = reshape(right_db(cheaks, :, :), 192, 168);
    out(b) = out(b) + a1(b) + a2(b);
end

% reshape(eye_left_db(1, :, :), 192, 168)
% reshape(eye_right_db(1, :, :), 192, 168)
% reshape(nose_db(1, :, :), 192, 168)
% reshape(mouth_db(1, :, :), 192, 168)
% reshape(left_db(1, :, :), 192, 168)
% reshape(right_db(1, :, :), 192, 168);

showImage(out);

break;



