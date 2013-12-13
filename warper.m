%TODO:
% include ShowImage file

clear;
clc;
close all;
disp('Hello and welcome to our script!');
disp('');

% A = imread('imgs\BioID_0001.pgm', 'pgm');

A(1,:,:) = imread('myImg\0.pgm', 'pgm');
A(2,:,:) = imread('myImg\1.pgm', 'pgm');
A(3,:,:) = imread('myImg\2.pgm', 'pgm');
A(4,:,:) = imread('myImg\3.pgm', 'pgm');
A(5,:,:) = imread('myImg\4.pgm', 'pgm');

B = reshape(A(1,:,:),192,168);
showImage(B);
B = reshape(A(2,:,:),192,168);
showImage(B);
B = reshape(A(3,:,:),192,168);
showImage(B);
B = reshape(A(4,:,:),192,168);
showImage(B);
B = reshape(A(5,:,:),192,168);
showImage(B);

return;
A = imread('myImg\1.pgm', 'pgm');

showImage(A);
disp('enter 1st');
[x, y] = ginput();
Ox = x';
Oy = y';

disp('enter 2nd');
[x, y] = ginput();
Tx = x';
Ty = y';

% baseed on myImg\0.pgm
% Tx = [42,69,91,116,81,10,36,56,36,109,134,159,132,56,80,108];
% Ty = [149,143,145,150,160,47,33,46,49,46,33,51,50,101,112,103];

B = warpImage(A, Ox, Oy, Tx, Ty);
% 
showImage(B);



