function [gerilen_resim] = KHistogramGerme(orijinal_resim, alt_sinir, ust_sinir)
    % Giriş görüntüsünün boyutlarını al
    orijinal_resim=KGriDonusum(orijinal_resim);
    [max, min] = size(orijinal_resim);
    
    % Giriş aralığının minimum ve maksimum değerlerini bul
    min = min(double(orijinal_resim(:)));
    max = max(double(orijinal_resim(:)));
    
    % Histogram germe işlemi formülü
    gerilen_resim = (double(orijinal_resim) - min) * ((ust_sinir - alt_sinir) / (max - min)) + alt_sinir;
    
    % Veri tipini uint8 olarak dönüştür
    gerilen_resim = uint8(gerilen_resim);
end
