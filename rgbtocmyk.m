%load image file
img = imread('flowers.tif', 'tif');

%extract RGB values
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

%prepare RGB values for conversion
RD = cast(R, 'double');
GD = cast(G, 'double');
BD = cast(B, 'double');
R2 = RD/255;
G2 = GD/255;
B2 = BD/255;

%get the CMY values
C = 1-R2;
M = 1-G2;
Y = 1-B2;

%get the K values
K = min(min(C,M), Y);

%get fUCR(K)
f_UCR = 0.1*K;

%convert to C'M'Y'K'
CP = C-f_UCR;
MP = M-f_UCR;
YP = Y-f_UCR;
size = size(K);
for r = 1:size(1,1)
    for c = 1:size(1,2)
        if K(r,c) < 0.3
            K(r,c) = 0;
        else
            K(r,c) = 0.9 * ((K(r,c) - 0.3)/(1 - 0.3));
        end
    end
end
cmyk = cat(3,CP,MP,YP,K);

%save images
imwrite(cmyk, 'flowers_CMYK.tif', 'tif');
imwrite(CP, 'flowers_C.tif', 'tif');
imwrite(MP, 'flowers_M.tif', 'tif');
imwrite(YP, 'flowers_Y (CMYK).tif', 'tif');
imwrite(K, 'flowers_K.tif', 'tif');