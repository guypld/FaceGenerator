function MergedImage = Poisson(srcImg, tgImg, MaskPoints, TargetPoint)
% srcImg - Matrix
% tgImg - Matrix
% MaskPoints - [x y]
% TargetPoint (x,y)



py = TargetPoint(2);
px = TargetPoint(1);
% 
% Image2Adr = 'OL.jpg';
% srcImg = imread(Image2Adr); %load image (BG)
% Image1Adr = 'sun.jpg';
% tgImg = imread(Image1Adr); %load image (insert)

%imshow(srcImg);

%imshow(tgImg);

[w , h , c] = size(tgImg);

x = MaskPoints(1,:);
y = MaskPoints(2,:);

polyMask = poly2mask(x,y,w,h);

polyMask = imcomplement(polyMask);

%imshow(polyMask);

cx = find(sum(polyMask), 1, 'first');
cy = find(sum(polyMask'), 1, 'first');
clx = find(sum(polyMask), 1, 'last') - cx;% + 1;
cly = find(sum(polyMask'), 1, 'last') - cy;% + 1;

BlendImg = srcImg;

for ii=cy:cy+cly
    for jj=cx:cx+clx
        if(polyMask(ii, jj))
            BlendImg(ii, jj, :) =  tgImg(ii, jj, :);
        else
            BlendImg(ii, jj, :) =  srcImg(ii, jj, :);
        end
    end
end

%imshow(BlendImg);

w = size(tgImg, 1);
h = size(tgImg, 2);
SizeSrcY = size(srcImg, 1);
SizeSrcX = size(srcImg, 2);
SizeTargetY = size(tgImg, 1);
SizeTargetX = size(tgImg, 2);

GrdSrc = zeros(size(srcImg));
for ii = 2:SizeSrcX-1
    for jj = 2:SizeSrcY-1
        for kk = 1:3
            GrdSrc(jj, ii, kk) = int16(srcImg(jj-1, ii, kk)) + int16(srcImg(jj+1, ii, kk)) + int16(srcImg(jj, ii-1, kk)) + int16(srcImg(jj, ii+1, kk)) - 4*int16(srcImg(jj, ii, kk));
        end
    end
end

GrdTg = zeros(size(tgImg));
for ii = 2:SizeTargetX-1
    for jj = 2:SizeTargetY-1
        GrdTg(jj, ii, :) = int16(tgImg(jj-1, ii, :)) + int16(tgImg(jj+1, ii, :)) + int16(tgImg(jj, ii-1, :)) + int16(tgImg(jj, ii+1, :)) - 4*int16(tgImg(jj, ii, :));
    end
end


%imshow(GrdSrc);

%imshow(GrdTg);

GrdBlend = GrdSrc;
for ii=1:cly
    for jj=1:clx
        if(polyMask(ii+cy-1, jj+cx-1))
            GrdBlend(ii+py, jj+px, :) =  GrdTg(ii+cy-1, jj+cx-1, :);
        else
            GrdBlend(ii+py, jj+px, :) =  GrdSrc(ii+py, jj+px, :);
        end
    end
end

%imshow(GrdBlend);
N = (cly) * (clx);
Y = zeros(N, 3);
X = zeros(N, 3);

for kk = 1:3
    for ii=1:cly
        for jj = 1:clx
            Y((ii-1)*clx + jj, kk) = GrdBlend(py-1+ii, px-1+jj, kk);
        end
    end

    for ii=1:clx   % first row
        Y(ii, kk) = srcImg(py, px+ii-1, kk);
    end
    for jj=2:cly-1 % first and last column from 2 to one to the last row.
        Y((jj-1)*clx + 1, kk) = srcImg(py-1+jj, px, kk);
        Y((jj-1)*clx + clx, kk) = srcImg(py-1+jj, px-1+clx, kk);
    end
    for ii=1:clx
        Y(clx*(cly-1)+ii, kk) = srcImg(py-1+cly, px-1+ii, kk);
    end
end

SparseCount = 1;
for ii=1:clx   % first row
    U(SparseCount) = ii;
    V(SparseCount) = ii;
    S(SparseCount) = 1;
    SparseCount = SparseCount+1;
end

for jj=2:cly-1 % first and last column from 2 to one to the last row.
    U(SparseCount) = (jj-1)*clx + 1;
    V(SparseCount) = (jj-1)*clx + 1;
    S(SparseCount) = 1;
    U(SparseCount+1) = (jj-1)*clx + clx;
    V(SparseCount+1) = (jj-1)*clx + clx;
    S(SparseCount+1) = 1;
    SparseCount = SparseCount + 2;
end

for ii=1:clx
    U(SparseCount) = clx*(cly-1)+ii;
    V(SparseCount) = clx*(cly-1)+ii;
    S(SparseCount) = 1;
    SparseCount = SparseCount+1;
end
    
for ii=2:cly-1   %Boundaries are done, now get to the core gradient part
    for jj = 2:clx-1
        U(SparseCount) = (ii-1)*clx + jj;
        V(SparseCount) = (ii-1)*clx + jj;
        S(SparseCount) = -4;
        U(SparseCount+1) = (ii-1)*clx + jj;
        V(SparseCount+1) = (ii-1)*clx + jj-1;
        S(SparseCount+1) = 1;
        U(SparseCount+2) = (ii-1)*clx + jj;
        V(SparseCount+2) = (ii-1)*clx + jj+1;
        S(SparseCount+2) = 1;
        U(SparseCount+3) = (ii-1)*clx + jj;
        V(SparseCount+3) = (ii-1)*clx + jj-clx;
        S(SparseCount+3) = 1;
        U(SparseCount+4) = (ii-1)*clx + jj;
        V(SparseCount+4) = (ii-1)*clx + jj+clx;
        S(SparseCount+4) = 1;      
        SparseCount = SparseCount+5;
    end
end

SC = sparse(U, V, S, N, N);
%fSC = full(SC);
%dif = fSC - Cm;
%dif = sum(abs(sum(abs(dif))));

%CInv = inv(Cm);

for kk=1:3
    %X(:, kk) = CInv * Y(:, kk);
    X(:, kk) = SC\Y(:, kk);
end

for ii=1:cly
    for jj=1:clx
        for kk=1:3
            OutBlend(ii, jj, kk) = uint8(X((ii-1)*clx + jj, kk));
        end
    end
end    
    
%Ro = srcImg(:, :, 1);
%Ri = OutBlend(:, :, 1);

MergedImage = srcImg;
for ii=1:cly
    for jj=1:clx
        if(polyMask(ii+cy-1, jj+cx-1))
            MergedImage(ii+py, jj+px, :) =  OutBlend(ii, jj, :);
        else
            MergedImage(ii+py, jj+px, :) =  srcImg(ii+py, jj+px, :);
        end
    end
end
%imshow(MergedImage);
