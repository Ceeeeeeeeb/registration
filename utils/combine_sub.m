function img_out = combine_sub(imgs,level)
img_out = [];
for i = 1:level
    im_tmp = [];
    for j = 1:level
        im_tmp = [im_tmp imgs(:,:,level*(i-1)+j)];
    end
    img_out = [img_out;im_tmp];
end
end