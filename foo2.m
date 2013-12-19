
load('myPoint\target.mat','Tx','Ty');

% MMax_x = max(Tx(1:5));
% MMax_y = max(Ty(1:5));
% MMin_x = min(Tx(1:5));
% MMin_y = min(Ty(1:5));

ELMax_x = max(Tx(6:9));
ELMax_y = max(Ty(6:9));
ELMin_x = min(Tx(6:9));
ELMin_y = min(Ty(6:9));

% ERMax_x = max(Tx(10:13));
% ERMax_y = max(Ty(10:13));
% ERMin_x = min(Tx(10:13));
% ERMin_y = min(Ty(10:13));

% NMax_x = max(Tx(14:16));
% NMax_y = max(Ty(14:16));
% NMin_x = min(Tx(14:16));
% NMin_y = min(Ty(14:16));

new_db = randomSubImage( IMAGE_DB, 5, 5, [ELMax_y, ELMax_x], [ELMin_y, ELMin_x]);

break;
