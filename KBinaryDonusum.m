function [imgBinary] = KBinaryDonusum(rgbImage,thresholdValue)
           grayImage = KGriDonusum(rgbImage);
           threshold = thresholdValue; %ayarlanabilir eşik değer


           binaryImg = grayImage >= threshold; % karşılaşıtrma sonrası doğru yanlış ı tutacak mantıksal dizi
           imgBinary = uint8(binaryImg * 255);
end
