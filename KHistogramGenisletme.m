function genislemis_resim = KHistogramGenisletme(orijinal_resim)
%Sadece RGB görüntüler için histogram genişletme 
    orijinal_resim = orijinal_resim / 255;

    % Çıkış görüntüsü için yer ayır
    genislemis_resim = zeros(size(orijinal_resim));

    % Her kanal için ayrı ayrı histogram genişletme
    for c = 1:3
        channel = orijinal_resim(:,:,c);
        minVal = min(channel(:));
        maxVal = max(channel(:));

        % Eğer kanal düz bir renge sahipse (min=max), bölme hatasını engelle
        if maxVal > minVal
            genislemis_resim(:,:,c) = (channel - minVal) / (maxVal - minVal);
        else
            genislemis_resim(:,:,c) = channel; % Değişiklik yapma
        end
    end

end


