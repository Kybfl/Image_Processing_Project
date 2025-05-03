function mean_temiz_resim = KMeanTemizleme(orijinal_resim, kernel_boyut, gurultu_sat)
    % Ortalama filtre ile gürültü temizleme (manual konvolüsyon ile)

    if nargin < 2
        kernel_boyut = 3;  % Varsayılan: 3x3
    end

    if kernel_boyut < 3
        error('Kernel boyutu 3 veya daha büyük olmalıdır.');
    end

    gri_resim = KGriDonusum(orijinal_resim);
    gurultulu_resim = KSaltPepper(gri_resim, gurultu_sat);

    % Ortalama filtre (sabit kernel)
    meanKernel = ones(kernel_boyut, kernel_boyut) / (kernel_boyut^2);

    % Zero pad ile konvolüsyon
    mean_temiz_resim = KKernelUygulama(double(gurultulu_resim), meanKernel);

    % Sonuç tekrar uint8’e çevrilir
    mean_temiz_resim = uint8(mean_temiz_resim);
end
