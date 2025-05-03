function [ycbcr_resmi] = KYCbCr(orijinal_resim)

orijinal_resim = orijinal_resim / 255; 

% Boyutları al
[rows, cols, ~] = size(orijinal_resim);

% YCbCr bileşenlerini
Y =  zeros(rows, cols);
Cb = zeros(rows, cols);
Cr = zeros(rows, cols);

for i = 1:rows
    for j = 1:cols
        R = orijinal_resim(i,j,1);
        G = orijinal_resim(i,j,2);
        B = orijinal_resim(i,j,3);
        
        Y(i,j)  = 0.299 * R + 0.587 * G + 0.114 * B;
        Cb(i,j) = -0.168736 * R - 0.331264 * G + 0.5 * B + 0.5; % 128/255 = 0.5
        Cr(i,j) = 0.5 * R - 0.418688 * G - 0.081312 * B + 0.5;
    end
end
% Sonucu birleştir
ycbcr_resmi = cat(3, Y, Cb, Cr);
end

