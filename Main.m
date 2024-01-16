clear all;  
clc; 
close all

%% read the HSI data being processed
a = dir;   
filename_path = a.folder;     
filename_path = strcat(filename_path,'\');
name_HSI = 'cut_1';     
name_target = 'target';

filename = strcat(filename_path,name_HSI,'.mat');
filename_target = strcat(filename_path, name_target, '.mat');

load(filename);
load(filename_target);

X_cube = data;
clear('data');
[samples,lines,band_num]=size(X_cube);
pixel_num = samples * lines;

gt = map;
clear('map');

mask = squeeze(gt(:));   



%% set parameters for the constrction of the chessboard-shaped topological framework  
 
ver = 13;   % the number of intervals for vertical division   
hor = 2;    % the number of intervals for horizontal division

%% perform target detection with CTTD
r_CTTD = CTTD(X_cube, target, ver, hor); 

%% illustrate detection results 
figure;
subplot(121), imagesc(gt); axis image;   title('Ground Truth')     
subplot(122), imagesc(r_CTTD); axis image;   title('Detection map of CTTD')    

%% evaluate detection results with ROC 
 
r_255 = squeeze(r_CTTD(:));
figure;
AUC = ROC(mask,r_255,'r')       

