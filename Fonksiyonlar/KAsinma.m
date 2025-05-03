function cikti = KAsinma(orijinal_resim, boyut)
   %sadece birlerden oluşan bir matrisle işleme sokulur
    yapiElemani = ones(boyut);
    gri_resim = KGriDonusum(orijinal_resim);
    [sat, sut] = size(gri_resim);
    [kSat, kSut] = size(yapiElemani);
    pad = floor([kSat, kSut] / 2);

    genis = KZeroPad(gri_resim, pad);
    cikti = zeros(sat, sut);

    % Aşındırma işlemi min değeri al
    for i = 1:sat
        for j = 1:sut
            bolge = genis(i:i+kSat-1, j:j+kSut-1);  %Genişletilmiş görüntü genis üzerinde yapısal elemanın 
                                                    %  geçerli olduğu yani pencereyi alıyoz
                                                     
            cikti(i,j) = min(bolge(yapiElemani == 1));   %Yapısal elemanda 1 olan konumlardaki piksellerin en 
                                                         % küçüğü alınarak sonuç görüntüsüne yazılır
        end
    end

    cikti = uint8(cikti);  % Görüntüyü tekrar 0-255 aralığına getir
end


