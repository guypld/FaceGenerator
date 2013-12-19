

for i = 1:7
    RANDOM = (int8(rand([1,5]) * 19) + 1);
    out = randomImage(IMAGE_DB, 5, RANDOM); 
end
