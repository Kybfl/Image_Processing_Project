function [donmus_img] = KDondur(orijinal_resim, dondurme_acisi)
    % Görüntüyü double tipe çeviriyoruz
    orijinal_resim = im2double(orijinal_resim);

    % Açıyı radyana çevir
    dondurme_acisi = deg2rad(dondurme_acisi);

    % Giriş görüntüsünün boyutlarını al
    [satir, sutun, kanal] = size(orijinal_resim);

    % Saat yönü tersinde döndürme matrisi 
    R = [cos(dondurme_acisi), -sin(dondurme_acisi); sin(dondurme_acisi), cos(dondurme_acisi)];

    % Tüm piksel koordinatlarını sırayla oluştur
    indis = 1;
    koordinatlar = zeros(2, satir * sutun);
    for i = 1:satir
        for j = 1:sutun
            koordinatlar(:, indis) = [i; j];
            indis = indis + 1;
        end
    end

    % Dönüşüm uygulanmış yeni koordinatlar
    yeni_koordinatlar = round(R * koordinatlar);

    % Negatif koordinat varsa pozitif yapmak için kaydır
    min_x = min(yeni_koordinatlar(1,:));
    min_y = min(yeni_koordinatlar(2,:));
    if min_x < 1
        yeni_koordinatlar(1,:) = yeni_koordinatlar(1,:) + (1 - min_x);
    end
    if min_y < 1
        yeni_koordinatlar(2,:) = yeni_koordinatlar(2,:) + (1 - min_y);
    end

    % Yeni görüntü boyutu belirle
    max_x = max(yeni_koordinatlar(1,:));
    max_y = max(yeni_koordinatlar(2,:));
    donmus_img = zeros(max_x, max_y, kanal);

    % Pikselleri yeni konumlarına aktar
    indis = 1;
    for i = 1:satir
        for j = 1:sutun
            x = yeni_koordinatlar(1, indis);
            y = yeni_koordinatlar(2, indis);
            donmus_img(x, y, :) = orijinal_resim(i, j, :);
            indis = indis + 1;
        end
    end
end
