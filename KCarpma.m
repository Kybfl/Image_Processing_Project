function sonuc = KCarpma(resim1, resim2)
    sonuc = zeros(size(resim1), 'like', resim1);

    % Pikselleri çarpma rgb resimler için tüm kanallara uygular
    for i = 1:size(resim1, 1)
        for j = 1:size(resim1, 2)
            for k = 1:size(resim1, 3)
                carpim = double(resim1(i,j,k)) * double(resim2(i,j,k));
                if isa(class(resim1), 'uint8')
                    sonuc(i,j,k) = uint8(min(carpim, 255));  % 255 ten yukarı çıkmasını engelle
                else
                    sonuc(i,j,k) = carpim;
                end
            end
        end
    end
end

