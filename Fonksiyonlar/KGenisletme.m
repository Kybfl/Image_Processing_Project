function cikti = KGenisletme(orijinal_resim, boyut)
    yapiElemani = ones(boyut); %sadece birlerden oluşan bir matrisle işleme sokulur

    gri_resim = KGriDonusum(orijinal_resim);
    [sat, sut] = size(gri_resim);
    [kSat, kSut] = size(yapiElemani);
    pad = floor([kSat, kSut] / 2);

    genis = KZeroPad(gri_resim, pad);
    cikti = zeros(sat, sut);

    for i = 1:sat
        for j = 1:sut
            bolge = genis(i:i+kSat-1, j:j+kSut-1);%Genişletilmiş görüntü genis üzerinde yapısal elemanın 
                                                    %  geçerli olduğu yani pencereyi alıyoz
            cikti(i,j) = max(bolge(yapiElemani == 1));%Yapısal elemanda 1 olan konumlardaki piksellerin en 
                                                         % büyüğü alınarak sonuç görüntüsüne yazılır
        end
    end
end

