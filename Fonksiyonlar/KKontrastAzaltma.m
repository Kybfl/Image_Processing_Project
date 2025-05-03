function cikti = KKontrastAzaltma(orijinal_resim, yuzdelik)
    % oran kontrast azaltma oranıdır. 0.5 gibi değer girilir

    gri_resim = KGriDonusum(orijinal_resim);
    gri_resim = double(gri_resim);

    % Gri seviyeyi ortalama etrafında sıkıştırıyoruz
    ort = mean(gri_resim(:));

    % fomrülle resim pikseli ortalamaya yaklaştırılır mesela 20 ortalam
    % olsun 50 ise pikselimiz olsun sonnuç 35 olarak çıkar ve griye
    % yaklaşır
    cikti = ort + (gri_resim - ort) * yuzdelik;

    % Sonuç 0–255 aralığında olmalı
    cikti = max(min(cikti, 255), 0);  
    cikti = uint8(cikti);
end


