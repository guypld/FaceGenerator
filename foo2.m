
% load('myPoint\target.mat','Tx','Ty');
load('newPoints\0.mat','Ox','Oy');
Ox = fix(Ox);
Oy = fix(Oy);

% MMax_x = max(Tx(1:5));
% MMax_y = max(Ty(1:5));
% MMin_x = min(Tx(1:5));
% MMin_y = min(Ty(1:5));

ELMax_x = max(Ox(1:4));
ELMax_y = max(Oy(1:4));
ELMin_x = min(Ox(1:4));
ELMin_y = min(Oy(1:4));

ERMax_x = max(Ox(9:12));
ERMax_y = max(Oy(9:12));
ERMin_x = min(Ox(9:12));
ERMin_y = min(Oy(9:12));

% NMax_x = max(Tx(14:16));
% NMax_y = max(Ty(14:16));
% NMin_x = min(Tx(14:16));
% NMin_y = min(Ty(14:16));

eye_left_db = randomSubImage( IMAGE_DB, 5, 5, [ELMax_y, ELMax_x], [ELMin_y, ELMin_x]);
eye_right_db = randomSubImage( IMAGE_DB, 5, 5, [ERMax_y, ERMax_x], [ERMin_y, ERMin_x]);

[x,y,z] = size(eye_left_db);

for i = 1:26
    showImage(reshape(eye_left_db(i, :, :), 192, 168));
end

for i = 1:26
    showImage(reshape(eye_right_db(i, :, :), 192, 168));
end

break;
