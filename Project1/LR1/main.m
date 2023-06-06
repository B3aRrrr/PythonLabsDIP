X=imread('peppers.png')   % My image was color so was MxNxP
Xc=X(:,:,1)         % crateda  grayscale image MxN
Xc(14,20)     % here my output was ans=129
Xc(14,20)=1   % changed the value of (14,20) to 1
Xc(14,20)      % here my output was ans=1
imshow(Xc) ;imshow(X) ;