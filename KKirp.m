function cikti = KKirp(orijinal_resim, satir, sutun, boy, en)
    cikti = zeros(boy, en);
    for i = 1:boy
        for j = 1:en
            cikti(i, j) = orijinal_resim(satir + i - 1, sutun + j - 1);
        end
    end
    cikti = uint8(cikti);
end

