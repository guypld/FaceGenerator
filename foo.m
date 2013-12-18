
C = nchoosek(1:5,3);
sizeC = size(C);

for i = 1 : sizeC(1);
    C(i, :)
    out = randomImage(IMAGE_DB, 5, C(i, :)); 
end


% for i = 1:7
%     RANDOM = (int8(rand([1,5]) * 19) + 1);
%     out = randomImage(IMAGE_DB, 5, RANDOM); 
% end