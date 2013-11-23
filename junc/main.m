% Face Generator

%TODO:
% include ShowImage file

clear;
clc;
close all;
disp('Hello and welcome to our script!');
disp('');

A = imread('imgs\BioID_0001.pgm', 'pgm');
Original = A;
A = (A * 0) + 255;

showImage(Original);
%print screan
f = getframe(gcf);
colormap(f.colormap);
ColorOrig = f.cdata;    %create MASK from conv


showImage(A);
hold on;            %# Add subsequent plots to the image

FileId=fopen('imgs\bioid_0001.pts');
npoints=textscan(FileId,'%s %f',1,'HeaderLines',1);

points=textscan(FileId,'%f %f',npoints{2},'MultipleDelimsAsOne',2,'Headerlines',2);
% now you have the values you want you can put them in a matrix or any variable
Y=cell2mat(points);

%Show Points
% plot( Y(:,1) , Y(:,2) , 'go' );  %# NOTE: x_p and y_p are switched (see note below)!

NOSE = [15;16;17;15];
MOUTH = [3;19;4;18;3];
k = MOUTH;
area(points{1,1}(k),points{1,2}(k));
% area([20,20,60,60,20], [20,60,60,20,20])

%print screan
f = getframe(gcf);
colormap(f.colormap);
B = f.cdata;    %create MASK from conv

S = size(B);
for r = 1:S(1,1,:)
    for c = 1:S(1,2,:)
        if B(r,c,:) == 0
            B(r,c,:) = 255;
        else
            B(r,c,:) = 1;
        end    
    end
end

B = B(:,:,1);

showImage(B);
% close all;
OriginalSize = size(ColorOrig);
imageSave = zeros(OriginalSize);
BlendImage(ColorOrig,ColorOrig,B,imageSave,[160, 220, 160, 220], [160, 40]);
% BlendImage(ColorOrig,ColorOrig,B,imageSave,[35, 55, 35, 55], [160, 40]);



disp('go for ron...');
% Median = medianFilt(Original, [15,15]);
% 
% S = size(Original);
% for r = 1:S(1,1)
%     for c = 1:S(1,2)
%         if B(r,c) == 0
%             Original(r,c) = Median(r,c);
%         end    
%     end
% end

% showImage(Original);

%B = B - 1;

disp('Done');

hold off;           %# Any subsequent plotting will overwrite the image!
