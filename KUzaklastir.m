function [uzaklasik_resim] = KUzaklastir(giris_resim, katsayi)
    % Giriş görüntüsünü double yap
    giris_resim = im2double(giris_resim);
    
    % Giriş görüntüsünün boyutları
    [satir, sutun, kanal] = size(giris_resim);

    % Yeni boyutları küçültme katsayısıyla hesapla
    yeni_satir = round(satir / katsayi);
    yeni_sutun = round(sutun / katsayi);

    % Çıkış görüntüsünü oluştur
    uzaklasik_resim = zeros(yeni_satir, yeni_sutun, kanal);

    % Her bir yeni pikselin eski konumdaki karşılığını bul
    for c = 1:kanal
        for i = 1:yeni_satir
            for j = 1:yeni_sutun
                % Orijinal görüntüdeki karşılık gelen konumu hesapla
                x = round(i * katsayi);
                y = round(j * katsayi);

                % Sınır kontrolü aşmaması için
                x = max(1, min(satir, x));
                y = max(1, min(sutun, y));

                % Pikseli ata
                uzaklasik_resim(i, j, c) = giris_resim(x, y, c);
            end
        end
    end
end
