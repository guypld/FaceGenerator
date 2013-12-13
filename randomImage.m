function [Out] = randomImage(wrapedDB, factor, random)
% return mix image from random pic from the DB
% Input:    wrapedDB [20 X 192 X 168] - data base of wraped images
%           factor [int8] - patch size [factor X factor]
%           random [1 X n] = selectin images to render a new image

RANDOM = random;
IMAGE_DB = wrapedDB;
FACTOR = factor;

As = size(IMAGE_DB);

Out = -1 * ones(As(2),As(3));

for i = 1:As(2)
    for j = 1:As(3)
        for randPic = RANDOM
            for x = i:(i+FACTOR)
                for y = j:(j+FACTOR)
                    if ( x > As(2) || y > As(3) )
                        break;
                    end
                    if Out(x,y) > -1
                        Out(x,y) = (Out(x,y) + IMAGE_DB(randPic,x,y)) / 2;
                    else
                        Out(x,y) = IMAGE_DB(randPic,x,y);
                    end
                end
            end
        end
    end
end

showImage(Out);

