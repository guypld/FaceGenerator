%TODO:
% include ShowImage file

clear;
clc;
close all;
disp('Hello and welcome to our script!');
disp('');

% A = imread('imgs\BioID_0001.pgm', 'pgm');
A = imread('myImg\6.pgm', 'pgm');

showImage(A);

[x, y] = ginput();

Ox = x'
Oy = y'

% baseed on myImg\0.pgm
Tx = [42,69,91,116,81,10,36,56,36,109,134,159,132,56,80,108];
Ty = [149,143,145,150,160,47,33,46,49,46,33,51,50,101,112,103]

% Ox = [ 10, 10, 20, 20 ];
% Oy = [ 10, 20, 20, 10 ];
% Tx = [ 15, 30, 30, 15 ];
% Ty = [ 30, 30, 15, 15 ];
% 
B = warpImage(A, Ox, Oy, Tx, Ty);
% 
showImage(B);

imwrite(B,'output\5out.pgm');


