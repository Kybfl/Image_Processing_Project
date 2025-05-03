function sonuc_resim = KMedianTemizleme(orijinal_resim, kernel_boyut, gurultu_orani)
    gri = KGriDonusum(orijinal_resim);
    gurultulu = KSaltPepper(gri, gurultu_orani);
    sonuc_resim = KMedian(gurultulu, kernel_boyut);
end