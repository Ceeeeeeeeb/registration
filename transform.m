function p_ = transform(p,T)
    pp = [p ones(5,1)];
    p_ = T*pp';
    p_ = (p_(1:2,:))';
end