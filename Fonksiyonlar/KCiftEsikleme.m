function esiklenmis_resim = KCiftEsikleme(orijinal_resim, altesik, ustesik)

    gri_resim = KGriDonusum(orijinal_resim);
    
    % ustesik ve altesik arasında kalan değerlerle eşleşen pikseller 1.
    % 0 olan pikseller bu aralığa uymayan piksellerdir
    esiklenmis_resim = (gri_resim >= altesik) & (gri_resim <= ustesik);

end

