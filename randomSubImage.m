function [ final ] = randomSubImage( imageDb, patchSize, N, p1, p2)

newDb_size = 0;

for i = 2:N
    newDb_size = newDb_size + nchoosek(N,i);
end

newDb = zeros(newDb_size, 192, 168);
index = 1;

for i = 2:N
    nCk = nchoosek(1:N,i);
    size_nCk = size(nCk);
    for x = 1 : size_nCk(1);
        nCk(x, :)
%         tmp = randomImage2(imageDb, patchSize, nCk(x, :), p1(2), p1(1), p2(2), p2(1)); 
%         tmp = randomImage(imageDb, patchSize, nCk(x, :)); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Out = -1 * ones(192,168);
        for ii = p2(1) : p1(1)
            for jj = p2(2) : p1(2)
                for randPic = nCk(x, :)
                    for xx = ii:(ii+patchSize)
                        for yy = jj:(jj+patchSize)
                            if ( xx > p1(1) || yy > p1(2))
                                break;
                            end
                            if Out(xx,yy) > -1
                                Out(xx,yy) = (Out(xx,yy) + imageDb(randPic,xx,yy)) / 2;
                            else
                                Out(xx,yy) = imageDb(randPic,xx,yy);
                            end
                        end
                    end
                end
            end
        end

%         showImage(Out);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        newDb(index, :, :) = Out;
        index = index + 1;
    end
    
end

final = newDb;

end

