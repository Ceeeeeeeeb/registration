function p = choose_p(x,y)
    p(1,:) = [x/2,y/2];
    p(2,:) = [x/4,y/4];
    p(3,:) = [3*x/4,y/4];
    p(4,:) = [x/4,3*y/4];
    p(5,:) = [3*x/4,3*y/4];
end