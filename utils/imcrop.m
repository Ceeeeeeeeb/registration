function im_out = imcrop(im,level)
[y,x] = size(im);
sub_y = ceil(y/level);
sub_x = ceil(x/level);
for i = y:sub_y*level-1
    im = [im;im(y,:)];
end
for j = x:sub_x*level-1
    im = [im im(:,x)];
end
im_out = im;
end