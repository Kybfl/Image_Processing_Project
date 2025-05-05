function cikti = KKernelUygulama(giris, kernel)
    % verilen gri görüntüye verilen kernel ile sıfır dolgulu konvolüsyon uygular.

    [resim_satir, resim_sutun] = size(giris);
    [kernel_satir, kernel_sutun] = size(kernel);

    % Her kenara eklenecek sıfır sayısını hesapla
    pad_satir = floor(kernel_satir / 2);
    pad_sutun = floor(kernel_sutun / 2);

    % Görüntüyü sıfırlarla genişlet
    genisletilmis = KZeroPad(giris, [pad_satir, pad_sutun]);

    % Çıktı görüntüsü boyut kayıpsız
    cikti = zeros(resim_satir, resim_sutun);

    % Her piksel için konvolüsyon işlemi
    for i = 1:resim_satir
        for j = 1:resim_sutun
            % Kernel büyüklüğündeki alanı al
            bolge = genisletilmis(i:i+kernel_satir-1, j:j+kernel_sutun-1);

            % alan ve kernel çarpımının toplamını al
            cikti(i, j) = sum(sum(bolge .* kernel));
        end
    end
end
