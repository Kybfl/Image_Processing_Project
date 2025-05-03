function cikti = KAcma(orijinal_resim, yapiElemani)
    % Önce aşındırma
    acilmis_resim = KAsinma(orijinal_resim, yapiElemani);
    % Sonra genişletme
    cikti = KGenisletme(acilmis_resim, yapiElemani);
end
