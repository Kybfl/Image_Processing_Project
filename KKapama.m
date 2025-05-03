function cikti = KKapama(orijinal_resim, boyut)
    % Önce genişletme
    kapanmis_resim = KGenisletme(orijinal_resim, boyut);
    % Sonra aşındırma
    cikti = KAsinma(kapanmis_resim, boyut);
end
