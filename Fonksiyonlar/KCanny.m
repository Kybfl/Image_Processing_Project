function kenarlar = KCanny(orijinal_resim, altesik, ustesik, gauss_boyut, gauss_sat)
    % altesik, ustesik çift eşikleme için eşik değerleri
    
    % Gaussian filtreyle yumuşat
    gaussianKernel = KGaussKernelOlusturma(gauss_boyut, gauss_sat);  % 5x5 boyut, sigma = 1.4
    griResim = KGriDonusum(orijinal_resim); 
    filtreli = KKernelUygulama(griResim, gaussianKernel);  % Sıfır dolgulu konvolüsyon

    % kenarları tespit etme sobel maskeleri
    X = [-1 0 1; -2 0 2; -1 0 1];
    Y = [1 2 1; 0 0 0; -1 -2 -1];

    % Gradyan hesaplama
    X = KKernelUygulama(filtreli, X);  % X yönündeki gradyanı hesapla
    Y = KKernelUygulama(filtreli, Y);  % Y yönündeki gradyanı hesapla

    % Gradyan büyüklüğü ve yönüNÜ hesapla
    gradMag = sqrt(X.^2 + Y.^2);
    gradDir = atan2(Y, X);       % gradyanın yönü
    gradDir = rad2deg(gradDir);  % derece cinsine çeviriyoz
    gradDir(gradDir < 0) = gradDir(gradDir < 0) + 180;  % negatif açılara 100 ekle

    [sat, sut] = size(gradMag);
    NMS = zeros(sat, sut);  % Non-maximum suppression sonucu

    % 3. İnce kenarların çıkarılması 
    for i = 2:sat-1
        for j = 2:sut-1
            a = 0; b = 0;
            deg = gradDir(i,j);

            if ((deg >= 0 && deg < 22.5) || (deg >= 157.5 && deg <= 180))
                a = gradMag(i, j+1);
                b = gradMag(i, j-1);
            elseif (deg >= 22.5 && deg < 67.5)
                a = gradMag(i-1, j+1);
                b = gradMag(i+1, j-1);
            elseif (deg >= 67.5 && deg < 112.5)
                a = gradMag(i-1, j);
                b = gradMag(i+1, j);
            elseif (deg >= 112.5 && deg < 157.5)
                a = gradMag(i-1, j-1);
                b = gradMag(i+1, j+1);
            end

            if gradMag(i,j) >= a && gradMag(i,j) >= b
                NMS(i,j) = gradMag(i,j);
            else
                NMS(i,j) = 0;
            end
        end
    end

    % Çift eşikleme (KCiftEsikleme kullanılmamasının nedeni KCiftEsikleme nin resim döndürmesidir)
    kenar_zayif = (NMS >= altesik) & (NMS < ustesik);
    kenar_guclu = (NMS >= ustesik);

    % zayıf kenarların güçlü kenarla bağlantısı varsa tut
    kenarlar = zeros(sat, sut);
    for i = 2:sat-1
        for j = 2:sut-1
            if kenar_guclu(i,j)
                kenarlar(i,j) = 1;
            elseif kenar_zayif(i,j)
                komsular = kenar_guclu(i-1:i+1, j-1:j+1);
                if any(komsular(:))
                    kenarlar(i,j) = 1;
                end
            end
        end
    end
end
