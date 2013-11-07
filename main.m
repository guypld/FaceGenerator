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

M = importdata('F:\CV_LAB\bioid_0000.pts');