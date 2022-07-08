function imgs = sub_images(img,level)
    if level==1
        imgs = img;
    else
        [y,x] = size(img);
        sub_y = round(y/level);
        sub_x = round(x/level);
        imgs = zeros(sub_y,sub_x,level.^2);
        for i =1:level
            for j = 1:level
                imgs(:,:,i+(j-1)*level) = img(sub_y*(j-1)+1:sub_y*j,sub_x*(i-1)+1:sub_x*i);
            end
        end
    end
end