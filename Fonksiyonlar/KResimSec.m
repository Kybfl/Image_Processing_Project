function [img] = KResimSec()
    % Kullanıcıdan resim dosyası seçtirir ve resmi okur
    [file, path] = uigetfile({'*.jpg;*.jpeg;*.png;*.bmp;*.tif','Resim Dosyaları (*.jpg, *.jpeg, *.png, *.bmp, *.tif)'}, ...
                              'Bir Resim Seçin');
    if isequal(file, 0)
        img = []; % Kullanıcı iptal ettiyse boş döner
    else
        img = imread(fullfile(path, file)); % Resmi oku
    end
end
