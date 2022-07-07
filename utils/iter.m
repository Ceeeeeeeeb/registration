function im_out = iter(source,target)

[m,~,~] = estimate_m(source,target);
[y,x] = size(source);

% tps wraping parameters
interp.method = 'nearest'; %'invdist','nearest'; %'none' % interpolation method
interp.radius = 4; % radius or median filter dimension
interp.power = 2; %power for inverse wwighting interpolation method

% error
err = 1e8;
tic

% the matrix T is initialized by the estimated parameters m
T = [m(1) m(2) m(5);m(3) m(4) m(6);0 0 1];
p = choose_p(x,y);

cnt = 0;
while(err>1e-2)
    cnt = cnt+1;
    p_  = transform(p,T);

    % similarity
    s = entropy(target-source);
    %s = sum(sum(ie(1:951,:).^2));

    %im = m(7)*im+m(8);
    % the transformation T is applied to the original source image
    wrapped = tpswarp(source,[size(im,2) size(im,1)],p_,p,interp);

    % then the new affine parameters are calculated for the transformed
    % source image and target image using equation 6
    [m_,k_,c_] = estimate_m(wrapped,target);

    T_ = [m_(1) m_(2) m_(5);m_(3) m_(4) m_(6);0 0 1];
    T = T*T_;

    s_ = entropy(target-wrapped);
    %s_ = sum(sum(ie_(1:951,:).^2));
    
    if s > s_
        im = wrapped;
        k = k_;
        c = c_;
        %m = [T(1,1);T(1,2);T(2,1);T(2,2);T(1,3);T(2,3);m_(7);m_(8)];
        m = [T(1,1);T(1,2);T(2,1);T(2,2);T(1,3);T(2,3)];
        err = sum((k(:)-c'*m).^2);
        fprintf("cnt = %d ",cnt);
        fprintf("err = %d\n",err);
        %imshow(wrapped,[])
    else
        break;
    end
end
im_out = im;
toc
end