% Create DB 
function [DB, pDB] = FcreateDb(image_count, h, w, points_count, warp_index)

DB = zeros(image_count, h, w);

pDB = zeros(image_count, 2, points_count);

% create DB
for i = 0 : (image_count-1)
    load(['Points\' num2str(i) '.mat'],'Ox','Oy');

    pDB(i+1, 1, :) = round(Ox');
    pDB(i+1, 2, :) = round(Oy');
end

Tx = reshape(pDB(warp_index, 1, :),1,points_count);
Ty = reshape(pDB(warp_index, 2, :),1,points_count);

for i = 0 : (image_count-1)
    disp(['Warping Images\' num2str(i) '.pgm to ' num2str(warp_index)]);
    
    size(pDB(i+1, 1, :))
    Ox = reshape(pDB(i+1, 1, :),1,points_count);
    Oy = reshape(pDB(i+1, 2, :),1,points_count);
    realImage = imread(['Images\' num2str(i) '.pgm'], 'pgm');
    DB(i+1, :, :) = warpImage(realImage, Ox, Oy, Tx, Ty);
end

