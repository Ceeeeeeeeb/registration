function [m,k,c] = estimate_m1(im,im1)
% prepare for derivative calculate
x = repmat(1:size(im,2),[size(im,1) 1]);
y = repmat((1:size(im,1))',[1 size(im,2)]);
cropx = zeros(size(im,1),1);
im_cropx = [cropx im];
cropy = zeros(1,size(im,2));
im_cropy = [cropy;im];


% fx
fx = diff(im_cropx,1,2);
% fy
fy = diff(im_cropy,1,1);
% ft
ft = im1-im;

% c
c1 = x.*fx;
c2 = y.*fx;
c3 = x.*fy;
c4 = y.*fy;
c5 = fx;
c6 = fy;
c7 = -im;
c8 = -1*ones(size(im));
c = [c1(:)';c2(:)';c3(:)';c4(:)';c5(:)';c6(:)';c7(:)';c8(:)'];


% k
k = ft + c1 + c4 + c7;
clear c1 c2 c3 c4 c5 c6 c7 c8

% m
m = (c*c')\(c*k(:));
end