% Generate Image
function [IMAGE] = FgenImage(db, mask, patch, overlap, base, eyes, nose, mouth)

[count, h, w] = size(db);

Out = -1 * ones(h, w);

for i = 1 : overlap : h
    for j = 1 : overlap : w
        
        a = getIndex(i, j, mask, base, eyes, nose, mouth);
        index = a(1);
%         a = [a(2:size(a,2)), a(1)];
        base = [base(2:size(base,2)), base(1)];
        eyes = [eyes(2:size(eyes,2)), eyes(1)];

        for x = i : (i+patch)
            for y = j : (j+patch)
                if ( x > h || y > w )
                    break;
                end
                if Out(x,y) > -1
                    if mask(x,y) == 0
                        Out(x,y) = (Out(x,y) + db(base(1),x,y)) / 2;
                    else
                        Out(x,y) = ( (Out(x,y) * (1-mask(x,y))) + (db(eyes(1),x,y) * (mask(x,y))));
                    end
                else
                    Out(x,y) = db(index,x,y);
                end
            end
        end
   
    end
end

IMAGE = Out;

function [index] = getIndex(x, y, mask, base, eyes, nose, mouth)

% rnd = randi(100, 1);
% if rnd > (mask(x,y) * 100)
if (mask(x,y) == 0)
    index = base;
else
    index = eyes;
end

function [pixel] = getPixel(db, x, y, mask, base, eyes)


pixel = (1-mask(x,y))

% pick(unique([1,1,2,3,4]), 3, 'o')
% int8(rand([1,5]) * 4) + 1
% pick(unique([1,1,2,3,4]), 3, 'o')
% myPick = pick(1:26,4, 'r');
% myPickSize = size(myPick)
% index = 10;











