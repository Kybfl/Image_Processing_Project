function cikti = KMedian(giris_resim, kernel_boyut)
    % Gürültü eklemeden medyan filtresi 
    
     % KMedianTemzizleme ile birlikte çalışıyor bu fonksiyon. KMedian
     % temizleme içerisinde zaten bir gri dönüşüm yapıkdığı için burda da
     % ikinci bir dönüşüm yapılmasın diye kontrol ettiriliyor
     if ~size(giris_resim, 3) == 3
        gri_resim = giris_resim;
    else
        gri_resim = KGriDonusum(giris_resim);
     end

    if nargin < 2
        kernel_boyut = 3;
    end

    [sat, sut] = size(gri_resim);
    pad = floor(kernel_boyut / 2);

    % Sıfır genişletme
    genisletilmis = KZeroPad(gri_resim, [pad, pad]);

    cikti = zeros(sat, sut);

    for i = 1:sat
        for j = 1:sut
            % Kernel boyutundaki alanı al 
            alan = genisletilmis(i:i+2*pad, j:j+2*pad);

            % Pencere içindeki tüm pikselleri tek dizi haline getirip sırala
            siralanmis = sort(alan(:));

            % Ortancayı al
            medyan = siralanmis(ceil(length(siralanmis)/2));

            % Sonucu çıktı görüntüsüne yaz
            cikti(i,j) = medyan;
        end
    end

    cikti = uint8(cikti); 
end
