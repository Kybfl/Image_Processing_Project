function [hsv_resmi] = KHSV(orijinal_resim)
%normalizasypn yapcaz
orijinal_resim = double(orijinal_resim);
orijinal_resim = orijinal_resim/255;

 % RGBden HSV renk uzayına dönüşüm
 r = orijinal_resim(:, :, 1);
 g = orijinal_resim(:, :, 2);
 b = orijinal_resim(:, :, 3);

 c_max = max(max(r, g), b);
 c_min = min(min(r, g), b);
 delta = c_max - c_min; %delta sıfır ise piksel gridir

 % ton hesaplama formülü
 hue = zeros(size(r)); %ton değerini tutmak için matris
 hue(delta == 0) = 0;
 hue(c_max == r & delta ~= 0) = 60 * mod((g(c_max == r & delta ~= 0) - b(c_max == r & delta ~= 0)) ./ delta(c_max == r & delta ~= 0), 6);
 hue(c_max == g & delta ~= 0) = 60 * ((b(c_max == g & delta ~= 0) - r(c_max == g & delta ~= 0)) ./ delta(c_max == g & delta ~= 0) + 2);
 hue(c_max == b & delta ~= 0) = 60 * ((r(c_max == b & delta ~= 0) - g(c_max == b & delta ~= 0)) ./ delta(c_max == b & delta ~= 0) + 4);

 % doygunluk hesaplama
 sat = zeros(size(r));
 %renk yoğunluğunun o pikseldeki en yüksek renk bileşenine oranını hesapla
 sat(c_max ~= 0) = delta(c_max ~= 0) ./ c_max(c_max ~= 0); 



 % değer hesaplama
 deger = c_max;

 % birden fazla matrisi cat ile birleştirip görüntüyü oluşturma
 hsv_resmi = cat(3, hue, sat, deger);


end

