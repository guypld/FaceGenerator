function    nim = medianFilt(im,winSize)
% function    nim = medianFilt(im,winSize)
%
%      Input:       im - a grayscale image (values in [0,255])
%                        winSize - a 1x2 vector describing the size (height,width) of the filtering window.
%        Output:     nim - a grayscale image (values in [0,255]) which is the median filtered im.
%                        Image nim is of the same size as im. 
    nim = zeros(size(im));  %create the nim img matrix for use

    imgH = size(im,1);
    imgW = size(im,2);
    
    medH = winSize(1);      % mask Height
    medW = winSize(2);     % mask Width
    
    medOrigY = floor(medH/2)+1;    %center of mask - Y scale
    medOrigX = floor(medW/2)+1;   %center of mask - X scale
    
    %cyclic pad: 
    % 9matrix with 9 images, the origin in Center, the rest (8 imgs)
    % are reflected images acording to theside of image with Center image
    %   NW  N   NE
    %   W   im   E
    %   SW  S   SE
%     
%     N = flipdim( im , 1);   %generate all 8 imgs
%     S = N;
%     E = flipdim( im , 2);
%     W = E;
%     SE = rot90(flipdim( im , 1 ));
%     NW = SE;
%     SW = rot90(flipdim( im , 2 ));
%     NE = SW;
    
%     R1 = cat (2,NW,N,NE);   % cat all images to big image, first make 3 rows (each row-3 imgs)
%     R2 = cat (2,W,im,E);
%     R3 = cat (2, SW,S,SE);

    R1 = cat ( 2 , im , im , im);
    
    CycImg = cat(1,R1,R1,R1); %big image is cat of all 3 rows - 9 images

    %Sanity check :
    %   putImage(CycImg);
   
    for i = imgW +1 : imgW*2 + 1,
        for j = imgH + 1 : imgH*2 + 1,
            W = CycImg( j -  medOrigY + 1 : j + ( medH - medOrigY) , i -  medOrigX + 1 : i + ( medW - medOrigX) );
            nim( j - (imgH) , i - (imgW) ) = median ( median (W) ) ;
        end
    end