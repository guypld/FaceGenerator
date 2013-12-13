% create DB

% load all images

% loop all posibilities and run foo
% function big_image_list = foo(images_vec, points_vec, weight_vec, target)

IMAGE_DB = zeros(20, 192, 168);
POINT_DB = zeros(20, 2, 16);   % 16 point number

% create DB
for i = 0:19
    disp(['myImg\' num2str(i) '.pgm']);
    A = imread(['myImg\' num2str(i) '.pgm'], 'pgm');
    IMAGE_DB(i+1, :, :) = A;
    
    load(['myPoint\' num2str(i) '.mat'],'Ox','Oy');

    POINT_DB(i+1, 1, :) = Ox;
    POINT_DB(i+1, 2, :) = Oy;
end

% wrap images

Tx = reshape(POINT_DB(1, 1, :),1,16);
Ty = reshape(POINT_DB(1, 2, :),1,16);

for i = 0:19
    tmp = reshape(IMAGE_DB(i+1, :, :),192,168);
    Ox = reshape(POINT_DB(i+1, 1, :),1,16);
    Oy = reshape(POINT_DB(i+1, 2, :),1,16);
    IMAGE_DB(i+1, :, :) = warpImage(tmp, Ox, Oy, Tx, Ty);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RANDOM = (int8(rand([1,6]) * 20) + 1)
% 
% out = randomImage(IMAGE_DB, 20, RANDOM); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RANDOM = (int8(rand([1,6]) * 20) + 1)
% FACTOR = 20;
% As = size(IMAGE_DB);
% Out = -1 * ones(As(2),As(3));
% 
% for i = 1:As(2)
%     for j = 1:As(3)
%         sec1 = (i:(i+FACTOR));
%         sec2 = (j:(j+FACTOR));
%         for randPic = RANDOM
%             for x = i:(i+FACTOR)
%                 for y = j:(j+FACTOR)
%                     if ( x > As(2) || y > As(3) )
%                         break;
%                     end
%                     if Out(x,y) > -1
%                         Out(x,y) = (Out(x,y) + IMAGE_DB(randPic,x,y)) / 2;
%                     else
%                         Out(x,y) = IMAGE_DB(randPic,x,y);
%                     end
%                 end
%             end
%         end
%     end
% end
% 
% showImage(Out);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%





