clear all;
addpath(genpath('util'));
show_has_label_only = 0;

tilename = 'train.mov';

% read images
tile = VideoReader(tilename);
num_frames = floor(tile.Duration*tile.FrameRate);
target_dir = 'frames';
path = fullfile(target_dir,tilename);
data_mat = matfile(fullfile(path,'data.mat'));
label_simple_mat = matfile(fullfile(path,'label_simple.mat'),'Writable',true);

% find frames that have labels
label_simple = label_simple_mat.label_simple;
label_simple_idx = find(label_simple==1);

% label images
global t
t = 0;
fig = figure(1);
set(fig,'KeyPressFcn',{@keyDownListenerLabelDataSimple,num_frames,data_mat,label_simple_mat,label_simple_idx,show_has_label_only});