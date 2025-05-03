function yiq_resmi = KYIQ(orijinal_resim)
    % RGB değerlerini double formatına çeviriyoruz
    orijinal_resim = double(orijinal_resim);

    % R, G, B bileşenlerini al
    R = orijinal_resim(:, :, 1);
    G = orijinal_resim(:, :, 2);
    B = orijinal_resim(:, :, 3);

    % YIQ dönüşüm formülü
    Y = 0.299 * R + 0.587 * G + 0.114 * B;
    I = 0.596 * R - 0.274 * G - 0.322 * B;
    Q = 0.211 * R - 0.523 * G + 0.312 * B;

    % Üç katmanı birleştir
    yiq_resmi = cat(3, Y, I, Q);
end
