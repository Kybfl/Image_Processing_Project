function [yaklasik_resim] = KYaklastir(orijinal_resim, yaklastirma_katsayi)
    % Giriş görüntüsünü double tipe çeviriyoz
    orijinal_resim = im2double(orijinal_resim);
    
    % Giriş görüntüsünün boyutları
    [satir, sutun, kanal] = size(orijinal_resim);

    % Yeni boyutlar
    yeni_satir = round(satir * yaklastirma_katsayi);
    yeni_sutun = round(sutun * yaklastirma_katsayi);

    % çıkış görüntüsünü başlat sıfırlarla
    yaklasik_resim = zeros(yeni_satir, yeni_sutun, kanal);

    % Her bir pikseli yeni konuma yerleştir
    for c = 1:kanal
        for i = 1:yeni_satir
            for j = 1:yeni_sutun
                % Orijinal görüntüdeki karşılık gelen koordinatı bul
                x = round(i / yaklastirma_katsayi);
                y = round(j / yaklastirma_katsayi);

                % Sınırlar dışına çıkmayı engelle
                x = max(1, min(satir, x));
                y = max(1, min(sutun, y));

                % Pikseli ata
                yaklasik_resim(i, j, c) = orijinal_resim(x, y, c);
            end
        end
    end
end
