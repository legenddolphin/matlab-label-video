clear all;
addpath(genpath('util'));

tilename = 'train.mov';

% read video and create directory
tile = VideoReader(tilename);
num_frames = floor(tile.Duration*tile.FrameRate);
target_dir = 'frames';
path = fullfile(target_dir,tilename);
if ~exist(path,'dir')
    mkdir(path);
end

% compute first frame
img_scale = 0.5;
fprintf('Processing frame 1\n');
img = imresize(readFrame(tile),img_scale);
img_height = size(img,1);
img_width = size(img,2);
data = zeros(img_height,img_width,3,num_frames,'uint8');
label_simple = false(1,num_frames);
label_simple = uint8(label_simple);
data(:,:,:,1) = img;

% separate video into frames
for i=2:num_frames
    fprintf('Processing frame %d\n', i);
    data(:,:,:,i) = imresize(readFrame(tile),img_scale);
end

% save files
fprintf('Saving data.mat\n');
save(fullfile(path,'data.mat'),'data','-v7.3');
fprintf('Saving label_simple.mat\n');
save(fullfile(path,'label_simple.mat'),'label_simple','-v7.3');
fprintf('Done\n');