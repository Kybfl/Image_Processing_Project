function saltpepper_resim = KSaltPepper(orijinal_resim, yogunluk)
   % Gri tonlamalı görüntüye salt & pepper gürültüsü ekler
    if yogunluk > 1 || yogunluk < 0 || isempty (yogunluk)
       error('0-1 Aralığında Değer Giriniz');
    end

    gri_resim = KGriDonusum(orijinal_resim);

    % Boyutları al
    [sat, sut] = size(gri_resim);

    % Toplam piksel sayısına göre gürültü piksel sayısını belirle
    gurultu_pikselleri = round(yogunluk * sat * sut);

    % Çıkış görüntüsünü başlat
    saltpepper_resim = gri_resim;

    tuz = randperm(sat * sut, round(gurultu_pikselleri/2));
    saltpepper_resim(tuz) = 1; %beyaz

    biber = randperm(sat * sut, round(gurultu_pikselleri/2));
    saltpepper_resim(biber) = 0; %siyah

end


