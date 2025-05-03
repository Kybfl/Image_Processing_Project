function motion_resim = KMotion(orijinal_resim, sat)
    % gir görüntülere uygulanır
    
    gri_resim = KGriDonusum(orijinal_resim);
    if nargin < 2
        sat = 9;  % Varsayılan uzunluk
    end

    % Hareket filtresi 
    kernel = zeros(sat);  
    for i = 1:sat
        kernel(i,i) = 1;
    end
    kernel = kernel / sat;  % Ağırlıkları normalize et

    [rows, cols] = size(gri_resim);     % Görüntü boyutu
    pad = floor(sat / 2);                % Kenar dolgusu

    % zero padding kullanılarak genişletme kayıp olmaması için
    paddedImage = zeros(rows + 2*pad, cols + 2*pad);
    paddedImage(1+pad:end-pad, 1+pad:end-pad) = gri_resim;

    motion_resim = zeros(rows, cols);  % Çıkış 
    for i = 1:rows
        for j = 1:cols
            % Filtre alanını alıyoz
            alan = paddedImage(i:i+sat-1, j:j+sat-1);

            % Eleman çarpımı ve toplam (maskeyle)
            value = sum(sum(alan .* kernel));

            motion_resim(i,j) = value;
        end
    end

    motion_resim = uint8(motion_resim);  % Sonuç görüntüsü
end


