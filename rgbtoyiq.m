%load image file
img=imread('flowers.tif', 'tif');

%extract RGB values
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

%get the YUV values
Y=0.299*R + 0.587*G + 0.114*B;
U=0.492 * (B-Y);
V=0.877 * (R-Y);

%get the I and Q values
I=-sind(33)*U + cosd(33)*V;
Q=cosd(33)*U + sin(33)*V;

%make the YIQ image
yiq=cat(3,Y,I,Q);

%save images
imwrite(yiq, 'flowers_YIQ.tif', 'tif');
imwrite(Y, 'flowers_Y (YIQ).tif', 'tif');
imwrite(I, 'flowers_I.tif', 'tif');
imwrite(Q, 'flowers_Q.tif', 'tif');