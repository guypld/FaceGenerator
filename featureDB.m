
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
disp('FINISH');




