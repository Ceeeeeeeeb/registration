clc
clear
close all

%% load source image as im, target image as im1
% im = dicomread(dicominfo("mask.dcm"));
% im1 = dicomread(dicominfo("fill.dcm")); 
im = double(imread("./data/mask.tif"));
im1 = double(imread("./data/contrast.tif"));

level = 1;
while(level<=4)
    % divide the source and target image into subimages
    [y,x] = size(im);

    % crop the image to be divisibility by level
    im_cropped = imcrop(im,level);
    im1_cropped = imcrop(im1,level);
    % split the image into sub images
    ims = sub_images(im_cropped,level);
    ims1 = sub_images(im1_cropped,level);
    % run the iteration
    for i =1:level^2
        ims(:,:,i) = iter(ims(:,:,i),ims1(:,:,i));
    end
    % combine the ims after iteration
    im_combined= combine_sub(ims,level);
    im1_combined= combine_sub(ims1,level);
    % reshape the image to the orignal size 
    im = im_combined(1:y,1:x);
    im1 = im1_combined(1:y,1:x);
    fprintf("%d \n",level);
    level = level+1;
end