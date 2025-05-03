function [gerilen_resim] = KHistogramGerme(orijinal_resim, a, b)
    % Giriş görüntüsünün boyutlarını al
    orijinal_resim=KGriDonusum(orijinal_resim);
    [sat, sut] = size(orijinal_resim);
    
    % Giriş aralığının minimum ve maksimum değerlerini bul
    sut = min(double(orijinal_resim(:)));
    d = max(double(orijinal_resim(:)));
    
    % Histogram germe işlemi formülü
    gerilen_resim = (double(orijinal_resim) - sut) * ((b - a) / (d - sut)) + a;
    
    % Veri tipini uint8 olarak dönüştür
    gerilen_resim = uint8(gerilen_resim);
end
