%TODO:
% include ShowImage file

% clear;
% clc;
% close all;
disp('Hello and welcome to our script!');
disp('');

% A = imread('imgs\BioID_0001.pgm', 'pgm');
A = zeros(5,192,168);

A(1,:,:) = imread('output\1out.pgm', 'pgm');
A(2,:,:) = imread('output\2out.pgm', 'pgm');
A(3,:,:) = imread('output\3out.pgm', 'pgm');
A(4,:,:) = imread('output\4out.pgm', 'pgm');
A(5,:,:) = imread('output\5out.pgm', 'pgm');



Out = zeros(192,168);
FACTOR = 1;

II = 192/FACTOR;
JJ = 168/FACTOR;
counter = 1;

for i = 1:(II-1)
    for j = 1:(JJ-1)
        sec1 = ((i*FACTOR)):((i*FACTOR)+FACTOR);
        sec2 = ((j*FACTOR)):((j*FACTOR)+FACTOR);   

        Out(sec1,sec2) = A(counter,sec1,sec2);
        counter = counter + 1;
        if(counter > 5)
            counter = 1;
        end
    end
end

showImage(Out);
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


% baseed on myImg\0.pgm
Tx = [42, 69, 91, 116,81,   10,36,56,36,   109,134,159,132,   56,80,108];
Ty = [149,143,145,150,160,  47,33,46,49,   46, 33, 51, 50,    101,112,103];




