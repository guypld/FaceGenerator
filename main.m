% Face Generator

%TODO:
% include ShowImage file

clear
clc
close all;
disp('Hello and welcome to our script!');
disp('');

A = imread('F:\CV_LAB\BioID_0001.pgm', 'pgm');
showImage(A);


FileId=fopen('F:\CV_LAB\bioid_0001.pts')
npoints=textscan(FileId,'%s %f',1,'HeaderLines',1)

points=textscan(FileId,'%f %f',npoints{2},'MultipleDelimsAsOne',2,'Headerlines',2);
% now you have the values you want you can put them in a matrix or any variable
Y=cell2mat(points);
hold on;            %# Add subsequent plots to the image



plot( Y(:,1) , Y(:,2) , 'go' );  %# NOTE: x_p and y_p are switched (see note below)!
hold off;           %# Any subsequent plotting will overwrite the image!