function sonuc = KCikarma(resim1, resim2)
    % Çıkış görüntüsünü başlat aynı boyut ve tipte
    sonuc = zeros(size(resim1), 'like', resim1);

    % Piksel çıkarma işlemi rgb resimler için tüm kanallara uygular
    for i = 1:size(resim1, 1)
        for j = 1:size(resim1, 2)
            for k = 1:size(resim1, 3)
                % Piksel farkı (double ile taşmayı önle)
                cikarma = double(resim1(i,j,k)) - double(resim2(i,j,k));
                
                % Eğer resimler uint8 ise sınırla [0, 255]
                if isa(resim1, 'uint8')
                    cikarma = max(0, min(255, cikarma)); % 0 altı ve 255 üstü engellenir
                    sonuc(i,j,k) = uint8(cikarma);
                else
                    sonuc(i,j,k) = cikarma; % Diğer türlerde sınır koyulmaz
                end
            end
        end
    end
end

