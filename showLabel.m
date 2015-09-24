clear all;
addpath(genpath('util'));

tilename = 'train.mov';

% read mask
target_dir = 'frames';
path = fullfile(target_dir,tilename);
load(fullfile(path,'label_simple.mat'));

% plot ground truth and prediction
figure;
img_cols = 1;
img_rows = 1;

subplot(img_rows,img_cols,1)
bar(label_simple,'r')
title('Ground truth')
