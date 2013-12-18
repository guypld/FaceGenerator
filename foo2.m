
% A = imread(['myImg\0.pgm'], 'pgm');
% [x, y] = ginput();
% 
% Ox = x'
% Oy = y'
for x = 1:6
    RANDOM = (int8(rand([1,5]) * 19) + 1)
    out1 = randomImage2(IMAGE_DB, 5, RANDOM, 10, 10, 60, 60); 
    out2 = randomImage2(IMAGE_DB, 5, RANDOM, 10, 100, 60, 160);
    RANDOM = (int8(rand([1,5]) * 19) + 1)
    out3 = randomImage2(IMAGE_DB, 5, RANDOM, 50, 55, 120, 110); 
    RANDOM = (int8(rand([1,5]) * 19) + 1)
    out4 = randomImage2(IMAGE_DB, 5, RANDOM, 135, 35, 165, 125); 

    final = zeros(192, 168);

    for i = 1:192
        for j = 1:168
            if out1(i, j) > 0
                final(i,j) = out1(i,j);
            end
            if out2(i, j) > 0
                final(i,j) = out2(i,j);
            end
            if out3(i, j) > 0
                final(i,j) = out3(i,j);
            end
            if out4(i, j) > 0
                final(i,j) = out4(i,j);
            end
        end
    end
    
    for i = 1:192
        for j = 1:168
            if final(i, j) <= 0
                final(i,j) = IMAGE_DB(1, i, j);
            end
        end
    end
    showImage(final);
end

    
