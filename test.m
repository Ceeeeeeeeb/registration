clear
close all

%% load source image as im, target image as im1
% im = dicomread(dicominfo("mask.dcm"));
% im1 = dicomread(dicominfo("fill.dcm")); 
im = double(imread("./data/mask.tif"));
im1 = double(imread("./data/contrast.tif"));

level = 1;

while(level<4)
    % divide the source and target image into subimages
    

end