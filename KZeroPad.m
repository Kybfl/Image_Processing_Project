function padded_resim = KZeroPad(gri_resim, padSize)
    % padSize padding boyutu [satır, sütun] şeklinde verilmeli parametre
    [rows, cols] = size(gri_resim);
    
    % Padding için boyutları
    paddedRows = rows + 2 * padSize(1);
    paddedCols = cols + 2 * padSize(2);
    
    % Yeni görüntüyü 0 değerleriyle başlat
    padded_resim = zeros(paddedRows, paddedCols);
    
    % Orijinal görüntüyü yeni görüntüye yerleştir
    padded_resim(1+padSize(1):end-padSize(1), 1+padSize(2):end-padSize(2)) = gri_resim;
end
