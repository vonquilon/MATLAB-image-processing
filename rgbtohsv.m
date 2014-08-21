%load image file
img=imread('flowers.tif', 'tif');

%convert to HSV color space
hsv=rgb2hsv(img);

%extract HSV color space
H=hsv(:,:,1);
S=hsv(:,:,2);
V=hsv(:,:,3);

%save images
imwrite(hsv, 'flowers_HSV.tif', 'tif');
imwrite(H, 'flowers_H.tif', 'tif');
imwrite(S, 'flowers_S.tif', 'tif');
imwrite(V, 'flowers_V.tif', 'tif');