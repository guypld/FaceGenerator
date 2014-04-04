
out = FgenImage(DB1, mask1, 3, 1, [1,2], [3,4], [5,6], [7,8]);
imshow(out, [0,255]);
break
showImage( FgenImage(DB1, mask1, 3, 1, [1,2], [3,4], [5,6], [7,8]) ); 
showImage( FgenImage(DB1, mask1, 3, 1, [1,3], [3,4], [5,6], [7,8]) ); 
showImage( FgenImage(DB1, mask1, 3, 1, [1,4], [3,4], [5,6], [7,8]) ); 
showImage( FgenImage(DB1, mask1, 3, 1, [1,5], [3,4], [5,6], [7,8]) ); 
showImage( FgenImage(DB1, mask1, 3, 1, [6,2], [3,4], [5,6], [7,8]) ); 
showImage( FgenImage(DB1, mask1, 3, 1, [6,3], [3,4], [5,6], [7,8]) ); 
showImage( FgenImage(DB1, mask1, 3, 1, [6,4], [3,4], [5,6], [7,8]) ); 
showImage( FgenImage(DB1, mask1, 3, 1, [6,5], [3,4], [5,6], [7,8]) ); 






% blockSize = 4;
% myPick = nchoosek(1:10, blockSize);
% s = size(myPick);
% 
% clear AA;
% j = 1;
% AA(j,:) = myPick(1, :);
% for i = 2 : s(1)
%     inter = intersect(AA(j, :), myPick(i, :));
%     if size(inter) <= (blockSize/2)
%         [AA(j, :) ; myPick(i, :)]
%         j = j+1;
%         AA(j,:) = myPick(i, :);
%     end
% end




