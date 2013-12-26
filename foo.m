

for i = 1:7
    RANDOM = (int8(rand([1,5]) * 4) + 1);
    out = randomImage(IMAGE_DB, 5, RANDOM); 
end
