function [imgBinary] = KBinaryDonusum(rgbImage,thresholdValue)
           grayImage = KGriDonusum(rgbImage);
           threshold = thresholdValue; %ayarlanabilir eşik değer


           binaryImgTF = grayImage >= threshold; % karşılaşıtrma sonrası doğru yanlış ı tutacak mantıksal dizi
           imgBinary = uint8(binaryImgTF * 255);
end
