% Generate Image
function [IMAGE] = FgenImage(db, mask, patch, overlap, base, eyes, nose, mouth)

[count, h, w] = size(db);

Out = -1 * ones(h, w);

for i = 1 : overlap : h
    for j = 1 : overlap : w
        
        a = getIndex(i, j, mask, base, eyes, nose, mouth);
        index = a(1);
        base = [base(2:size(base,2)), base(1)];
        eyes = [eyes(2:size(eyes,2)), eyes(1)];
        nose = [nose(2:size(nose,2)), nose(1)];
        mouth = [mouth(2:size(mouth,2)), mouth(1)];

        for x = i : (i+patch)
            for y = j : (j+patch)
                if ( x > h || y > w )
                    break;
                end
                if Out(x,y) > -1
                    if mask(x,y) == 0
                        Out(x,y) = (Out(x,y) + db(base(1),x,y)) / 2;
                    else
                        factor = mask(x,y) - floor(mask(x,y));
                        Out(x,y) = ( (Out(x,y) * (1-factor)) + (db(index(1),x,y) * (factor)));
                    end
                else
                    if mask(x,y) == 0
                        Out(x,y) = db(index,x,y);
                    else
                        factor = mask(x,y) - floor(mask(x,y));
                        Out(x,y) = ( (db(base(1),x,y) * (1-factor)) + (db(index(1),x,y) * (factor)));
                    end
                    
                end
            end
        end
   
    end
end

Out = filter2(fspecial('average',3),Out);
Out = filter2(fspecial('average',3),Out);

IMAGE = Out;

function [index] = getIndex(x, y, mask, base, eyes, nose, mouth)

if (mask(x,y) > 2)
    index = mouth;
elseif mask(x,y) > 1 
    index = nose;
elseif mask(x,y) > 0 
    index = eyes;
else 
    index = base;
end

% pick(unique([1,1,2,3,4]), 3, 'o')
% int8(rand([1,5]) * 4) + 1
% pick(unique([1,1,2,3,4]), 3, 'o')
% myPick = pick(1:26,4, 'r');
% myPickSize = size(myPick)
% index = 10;











