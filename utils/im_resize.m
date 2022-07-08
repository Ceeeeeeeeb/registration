function im_out = im_resize(im_in)
nGongBei = 60;
[nImgHeight,nImgWidth] = size(im_in);

nValidImgHeight = floor(nImgHeight / nGongBei) * nGongBei;
nValidImgWidth = floor(nImgWidth / nGongBei) * nGongBei;

nRemainWidth = nImgWidth - nValidImgWidth;
nLeftRemainWidth = floor(nRemainWidth / 2);
nRightRemainWidth = nRemainWidth - nLeftRemainWidth;

nRemainHeight = nImgHeight - nValidImgHeight;
nTopRemainWidth = floor(nRemainHeight / 2);
nBottomRemainWidth = nRemainHeight - nTopRemainWidth;
im_out = im_in(nTopRemainWidth + 1:end - nBottomRemainWidth,nLeftRemainWidth + 1:end - nRightRemainWidth);
end