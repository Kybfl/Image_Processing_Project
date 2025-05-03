function [giris_histogram] = KGirisHistogram(orijinal_resim)
    % Görüntüyü gri tonlamaya dönüştür
    gri_resim = KGriDonusum(orijinal_resim);
    
    % Görüntü boyutlarını al
    [satir_sayisi, sutun_sayisi] = size(gri_resim);
    
    % 256 elemanlı histogram dizisini oluştur (başlangıçta tüm değerler sıfır)
    giris_histogram = zeros(256, 1);
    
    % Görüntü üzerinde döngü ile işlem yaparak histogramı hesapla
    for satir = 1:satir_sayisi
        for sutun = 1:sutun_sayisi
            % Piksel değerini al
            piksel_degeri = gri_resim(satir, sutun);
            
            % Histogramda ilgili piksel değerini bir artır
            giris_histogram(piksel_degeri + 1) = giris_histogram(piksel_degeri + 1) + 1;
        end
    end
end

