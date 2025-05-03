function kernel = KGaussKernelOlusturma(boyut, sat)
% canny için gauss
% boyut filtrenin boyutu
% sat bulanıklığın miktarı

    % ortada merkez piksel olmalı
    if mod(boyut, 2) == 0
        error('Lütfen tek sayı bir boyut girin. (Örneğin: 3, 5, 7)');
    end

    % Filtrenin yarıçapını bul mesela 3x3 filtre için yarıçap 1
    yaricap = floor(boyut / 2);

    % X ve Y koordinat matrislerini oluştur -1, 0, 1 
    [X, Y] = meshgrid(-yaricap:yaricap, -yaricap:yaricap);

    % 2 boyutlu Gaussian maskesi oluşturma 
    kernel = exp(-(X.^2 + Y.^2) / (2 * sat^2));

    % Tüm değerlerin toplamı 1 olur
    kernel = kernel / sum(kernel(:));
end


