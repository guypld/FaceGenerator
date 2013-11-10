% Face Generator

%TODO:
% include ShowImage file

clear;
clc;
close all;
disp('Hello and welcome to our script!');
disp('');

A = imread('imgs\BioID_0001.pgm', 'pgm');
%A = A * 0;
showImage(A);

hold on;            %# Add subsequent plots to the image

FileId=fopen('imgs\bioid_0001.pts');
npoints=textscan(FileId,'%s %f',1,'HeaderLines',1);

points=textscan(FileId,'%f %f',npoints{2},'MultipleDelimsAsOne',2,'Headerlines',2);
% now you have the values you want you can put them in a matrix or any variable
Y=cell2mat(points);

%Show Points
plot( Y(:,1) , Y(:,2) , 'go' );  %# NOTE: x_p and y_p are switched (see note below)!


% create polygon from the pnts: 18,7,3,6,12,19

%draw the conv
k = convhull(points{1,1},points{1,2});
area(points{1,1}(k),points{1,2}(k));



%print screan
f = getframe(gcf);
colormap(f.colormap);
B = f.cdata;    %create MASK from conv
image(B);




B = B - 1;




hold off;           %# Any subsequent plotting will overwrite the image!