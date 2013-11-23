%
% Blend the image
% 
% parameters
% imageSrc - source image
% imageDst - destination image
% imageMask - Mask image
% imageSave - Save result path
% boxSrc - the rectangular box for the selection in source, [x0 x1 y0 y1]
% posDest - the upper left corner of the source should go to this position
% in the destination image [x0 y0]
function BlendImage(imageSrc,imageDst,imageMask,imageSave,boxSrc,posDest)

    im = double(imageDst);

    iminsert = double(imageSrc);
    imMask=uint8(imageMask);

    t=tic;
    [imr img imb] = decomposeRGB(im);
    [imir imig imib] = decomposeRGB(iminsert);

    imr = poissonSolverMask(imir, imr, boxSrc, posDest, imMask);
    img = poissonSolverMask(imig, img, boxSrc, posDest, imMask);
    imb = poissonSolverMask(imib, imb, boxSrc, posDest, imMask);

    imnew = composeRGB(imr, img, imb);
    toc(t);
    imnew = uint8(imnew);
    figure(100);
    imshow(imnew);
    %imwrite(imnew, imageSave, 'JPG');
end


%     im = double(imread(imageDst));
% 
%     iminsert = double(imread(imageSrc));
%     imMask=uint8(imread(imageMask));
% 
%     t=tic;
%     [imr img imb] = decomposeRGB(im);
%     [imir imig imib] = decomposeRGB(iminsert);
% 
%     imr = poissonSolverMask(imir, imr, boxSrc, posDest, imMask);
%     img = poissonSolverMask(imig, img, boxSrc, posDest, imMask);
%     imb = poissonSolverMask(imib, imb, boxSrc, posDest, imMask);
% 
%     imnew = composeRGB(imr, img, imb);
%     toc(t);
%     imnew = uint8(imnew);
%     figure(100);
%     imshow(imnew);
%     imwrite(imnew, imageSave, 'JPG');
% end