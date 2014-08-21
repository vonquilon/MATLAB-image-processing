%load image file
img=imread('flowers.tif', 'tif');

%extract RGB values
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

%convert to YUV values
Y=0.299*R + 0.587*G + 0.114*B;
U=0.492 * (B-Y);
V=0.877 * (R-Y);

%make the YUV image
yuv=cat(3,Y,U,V);

%save images
imwrite(yuv, 'flowers_YUV.tif', 'tif');
imwrite(Y, 'flowers_Y.tif', 'tif');
imwrite(U, 'flowers_U.tif', 'tif');
imwrite(V, 'flowers_V (YUV).tif', 'tif');