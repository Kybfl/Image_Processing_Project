function [grayImage] = KGriDonusum(rgbImage)
    % RGB resmi gri tonlamaya çevir
    [~, ~, k] = size(rgbImage);
    if k == 3 % rgb ise renk uzayı 3 ise
        grayImage = uint8(0.2989 * double(rgbImage(:,:,1)) ...
            + 0.5870 * double(rgbImage(:,:,2)) ...
            + 0.1140 * double(rgbImage(:,:,3)));
    else
        grayImage = rgbImage; %  griyse işlem yapmadan kaydet
    end
end
